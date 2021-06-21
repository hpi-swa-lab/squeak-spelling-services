ispell-parsing
guesses: aLine
	"Returns a list of guesses for a word, if available"
	({ self guess . self miss } includes: aLine first) ifFalse: [^ #()].
	"Skip over token, original, guess-count and offset"
	^ (aLine findTokens: ', ') allButFirst: 4
