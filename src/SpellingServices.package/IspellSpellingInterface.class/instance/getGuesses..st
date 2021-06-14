guesses
getGuesses: aWord
	"only checks one word"
	^ self guesses: (self runIspellFor: aWord) first
