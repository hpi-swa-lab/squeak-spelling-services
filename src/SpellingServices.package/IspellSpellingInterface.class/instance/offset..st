ispell-parsing
offset: aLine
	"Returns the offset of the misspelled word in the checked text"
	| parts |
	(self correct includes: aLine first) ifTrue: [^ ''].
	parts := aLine findTokens: {Character space . $:}.
	^ (aLine first = self none
		ifTrue: [parts third]
		ifFalse: [parts fourth]) asInteger