#!/bin/bash

echo "Nothing to install, OSVM should contain SpellingPlugin"

echo "Let's install ispell anyway so we can test mac OS callouts from IspellSpellingInterface, just in case the SpellingPlugin is not available ..."
brew install ispell
