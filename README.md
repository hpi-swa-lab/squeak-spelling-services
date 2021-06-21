# Squeak SpellingServices

[![CI](https://github.com/hpi-swa-lab/squeak-spelling-services/actions/workflows/ci.yml/badge.svg)](https://github.com/hpi-swa-lab/squeak-spelling-services/actions/workflows/ci.yml)

A simple API for spell-checking and -correction in [Squeak/Smalltalk](https://squeak.org).
Includes support for Windows, Linux and macOS.

## Installation

1. [Get Squeak 5.3 or newer](https://squeak.org/downloads/)

2. Open a workspace and do the following:

   ```smalltalk
   Metacello new
   	baseline: 'SpellingServices';
   	repository: 'github://hpi-swa-lab/squeak-spelling-services:main';
   	load.
   ```

3. Depending on your platform:

   - **Linux/macOS:** Install [`ispell`](https://www.gnu.org/software/ispell/).
   
     Make sure that `ispell` is in your `$PATH`, or alternatively, change the binary path as described right below.
   
   - **Windows:** Install [`aspell`](http://aspell.net/win32/).

     Open the Preference Browser from the main docking bar. In the SpellingInterface preference (I/A/Spell binary path), store the path to your `aspell.exe`.

## Usage

### Find spelling issues

```smalltalk
spelling := SpellingInterface new.

spelling checkSpellingOf: 'Hello Wrld!'. "~~> #(7 4)"

spelling checkSpellingOf: 'Hello frm Sqeuak!' startingAt: 1. "~~> #(7 3)"
spelling checkSpellingOf: 'Hello frm Sqeuak!' startingAt: 10. "~~> #(11 6)"
spelling checkSpellingOf: 'Hello frm Sqeuak!' startingAt: 17. "~~> #(0 0)"
spelling checkSpellingOf: 'Hello from Squeak!' startingAt: 1. "~~> #(0 0)"
```

### Suggest corrections

```smalltalk
(spelling getGuesses: 'frm') first: 5. "~~> an OrderedCollection('from' 'farm' 'fem' 'firm' 'form')"
(spelling getGuesses: 'Sqeuak') first: 3. "~~> an OrderedCollection('Squeak' 'Squeaky' 'Squawk')"
```

### Define ignored words

```smalltalk
spelling := SpellingInterface new.
spelling setIgnoredWord: 'SpellingServices'.
spelling checkSpellingOf: 'Hello from SpellingServices!' startingAt: 1. "~~> #(0 0)"
```

## How does it work?

Historically, this package was built around the `SpellingPlugin` in the [OpenSmalltalk VM](https://github.com/OpenSmalltalk/opensmalltalk-vm) which provides access to [`NSSpellChecker` interface on macOS](https://developer.apple.com/documentation/appkit/nsspellchecker).
However, at a later point in time, some smart people went about making this package usable for non-applish systems as well, and eventually, they came up with an adapter for the GNU command-line tool [`ispell`](https://www.gnu.org/software/ispell/) that is fit into the same protocol.
`ispell` only runs on Unix systems, but there is a fork of it, [`aspell`](http://aspell.net/), that also includes a [port for Windows](http://aspell.net/win32/) which is offically unsupported and unmaintained, but still working as of today on Windows 10 20H1.
Access to `ispell` and `aspell` is realized through [`OSProcess`](http://wiki.squeak.org/squeak/708), or [FFI](https://wiki.squeak.org/squeak/1414), if the former is not available.

Remarkably, there appear to be [issues](https://github.com/hpi-swa-lab/squeak-spelling-services/issues/2) with the SpellingPlugin in the present which will cause SpellingServices to fall back on `ispell` even on macOS.
If you have a mac and feel like contributing to this repository, your help on investigating and debugging this issue will be appreciated!
