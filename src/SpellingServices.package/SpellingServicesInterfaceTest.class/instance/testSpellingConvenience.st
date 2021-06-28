tests
testSpellingConvenience

	| s |
	s := spelling checkSpellingOf: 'recieve'.
	self should: [(s at: 1) = 1].
	self should: [(s at: 2) = 7].
	s := spelling checkSpellingOf: 'receive'.
	self should: [(s at: 2) = 0].