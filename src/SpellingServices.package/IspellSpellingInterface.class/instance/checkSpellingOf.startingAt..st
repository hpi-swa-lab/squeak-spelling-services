spelling
checkSpellingOf: aString startingAt: anInteger
	"returns a tuple, first element is start of first bad word, second is number of bad chars. If no incorrect word was found, returns #(0 0)"
	| words checkedString |
	checkedString := aString copyFrom: anInteger to: aString size.
	words := checkedString findTokens: Character separators, '-.:,?!'.
	(self runIspellFor: checkedString) withIndexDo: [:line :idx |
		(line notEmpty and: [
		(line first = $&) or: [line first = $?] or: [line first = $#]]) "Miss, Guess, None"
			ifTrue: [| falseWord |
				falseWord := (words at: idx).
				^ { (checkedString findString: falseWord) + anInteger - 1.
					falseWord size }]].
	^ #(0 0)