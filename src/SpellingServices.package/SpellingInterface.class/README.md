I provide a simple interface for spell-checking and -correction strings. For installation instruction and detailed documentation, please visit the GitHub repository: https://github.com/hpi-swa-lab/squeak-spelling-services/blob/main/README.md

Common usage:

- Find spelling issues:

	spelling := SpellingInterface new.

	spelling checkSpellingOf: 'Hello Wrld!'. "~~> #(7 4)"

	spelling checkSpellingOf: 'Hello frm Sqeuak!' startingAt: 1. "~~> #(7 3)"
	spelling checkSpellingOf: 'Hello frm Sqeuak!' startingAt: 10. "~~> #(11 6)"
	spelling checkSpellingOf: 'Hello frm Sqeuak!' startingAt: 17. "~~> #(0 0)"
	spelling checkSpellingOf: 'Hello from Squeak!' startingAt: 1. "~~> #(0 0)"

- Suggest corrections:

	spelling := SpellingInterface new.
	(spelling getGuesses: 'frm') first: 5. "~~> an OrderedCollection('from' 'farm' 'fem' 'firm' 'form')"
	(spelling getGuesses: 'Sqeuak') first: 3. "~~> an OrderedCollection('Squeak' 'Squeaky' 'Squawk')"

- Define ignored words:

	spelling := SpellingInterface new.
	spelling setIgnoredWord: 'SpellingServices'.
	spelling checkSpellingOf: 'Hello from SpellingServices!' startingAt: 1. "~~> #(0 0)"