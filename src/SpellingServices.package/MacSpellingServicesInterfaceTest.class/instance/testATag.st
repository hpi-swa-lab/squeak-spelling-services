running
testATag
	| s |
	Smalltalk platformName asLowercase ~= 'mac os' ifTrue: [^ self].
	s := spelling primGetUniqueSpellingTag.
	self should: [s isNumber].
	self should: [s > 0].
	