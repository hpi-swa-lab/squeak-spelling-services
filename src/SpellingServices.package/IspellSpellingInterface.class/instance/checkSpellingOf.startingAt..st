spelling
checkSpellingOf: aString startingAt: anInteger
	"returns a tuple, first element is start of first bad word, second is number of bad chars.
	If no incorrect word was found, returns #(0 0)"
	(self runIspellFor: (aString copyFrom: anInteger to: aString size)) do: [:line |
		(self misspelled includes: line first) ifTrue: [
			^ { (self offset: line) + anInteger . (self original: line) size }]].
	^ #(0 0)