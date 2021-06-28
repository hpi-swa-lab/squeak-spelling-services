tests
testGetIgnoredWords
	| s |
	s := spelling getIgnoredWords.
	self should: [s isCollection].
	