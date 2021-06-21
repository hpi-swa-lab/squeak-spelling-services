running
testATag
	| s |
	self isMacOS ifFalse: [^ self].
	s := spelling primGetUniqueSpellingTag.
	self should: [s isNumber].
	self should: [s > 0].
	