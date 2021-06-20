ispell-parsing
original: aLine
	"Returns the checked word for misspellings"
	(self correct includes: aLine first) ifTrue: [^ ''].
	^ (aLine findTokens: Character space) second