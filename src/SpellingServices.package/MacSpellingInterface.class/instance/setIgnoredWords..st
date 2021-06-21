ignored words
setIgnoredWords: anArray
	"AnArray is unicode 16bit values"

	| utf16 |
	self primSetIgnoredWordsListLength: anArray size withTag: Tag.
	1 to: anArray size  do: [:i | 
		utf16 _ self unknownToUTF16: (anArray at: i).
		self primSetIgnoredWords: utf16 withTag: Tag at: i].