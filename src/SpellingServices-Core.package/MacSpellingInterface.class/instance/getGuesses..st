guesses
getGuesses: aString
	| size collection word utf16 toGuess |
	
	toGuess := self unknownToUTF16: aString.
	size := self primGetGuessesForWordListLength: toGuess withTag: Tag.
	collection := OrderedCollection new: size.
	1 to: size do: [:i |
		word := self primGetGuessesForWordwithTag: Tag at: i.
		utf16 := self byteStringToUTF16: word.	
		collection add: utf16].
	^collection