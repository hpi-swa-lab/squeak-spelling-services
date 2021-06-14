ignored words
setIgnoredWord: aString
	"unicode32 is unicode value"
	| utf16 |

	utf16 := self unknownToUTF16: aString.
	self primSetNewIgnoredWord: utf16 withTag: Tag
