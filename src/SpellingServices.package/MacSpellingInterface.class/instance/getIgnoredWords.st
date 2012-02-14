ignored words
getIgnoredWords
	| size collection word utf16 |
	
	size := self primGetIgnoredWordsListLengthWithTag: Tag.
	size isZero ifTrue: [^OrderedCollection new].
	collection := OrderedCollection new: size.
	1 to: size do: [:i |
		word := self primGetIgnoredWordWithTag: Tag at: i.
		utf16 := self byteStringToUTF16: word.
		collection add: utf16].
	^collection