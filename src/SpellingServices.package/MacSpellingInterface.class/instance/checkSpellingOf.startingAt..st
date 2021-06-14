spelling
checkSpellingOf: aString startingAt: anInteger
	| results utf16 |

	utf16 := self unknownToUTF16: aString.
	results := self primCheckSpelling: utf16 startingAt: anInteger.
	^results