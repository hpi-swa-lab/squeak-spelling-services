tests
testSpellingOffset
	| s i |

	spelling setIgnoredWords: (OrderedCollection new).
	i := spelling getIgnoredWords.
	self should: [i size = 0].
	s := spelling checkSpellingOf: 'too recieve' startingAt: 1.
	self should: [(s at: 1) = 5].
	self should: [(s at: 2) = 7].
	s := spelling checkSpellingOf: 'too more recieve' startingAt: 1.
	self should: [(s at: 1) = 10].
	self should: [(s at: 2) = 7].
	s := spelling checkSpellingOf: 'toox more recieve' startingAt: 1.
	self should: [(s at: 1) = 1].
	self should: [(s at: 2) = 4].
	s := spelling checkSpellingOf: 'toox more recieve' startingAt: 6.
	self should: [(s at: 1) = 11].
	self should: [(s at: 2) = 7].
