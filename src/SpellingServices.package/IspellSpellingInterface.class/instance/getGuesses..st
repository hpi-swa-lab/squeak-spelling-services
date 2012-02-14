guesses
getGuesses: aWord
	| idx line |
	line := (self runIspellFor: aWord) first "firstLine".
	^ (idx := line indexOf: $:) ~= 0 "colon separates guesses from other info"
		ifTrue: [(line copyFrom: idx to: line size) findTokens: ', ']
		ifFalse: [#()]
