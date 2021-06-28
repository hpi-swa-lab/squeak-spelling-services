tests
testSpelling
	| s i |

	spelling setIgnoredWords: (OrderedCollection new).
	i := spelling getIgnoredWords.
	self should: [i size = 0].
	s := spelling checkSpellingOf: 'recieve' startingAt: 1.
	self should: [(s at: 1) = 1].
	self should: [(s at: 2) = 7].
	s := spelling checkSpellingOf: 'receive' startingAt: 1.
	self should: [(s at: 2) = 0].
	spelling setIgnoredWord: 'recieve'.
	s := spelling checkSpellingOf: 'recieve' startingAt: 1.
	self should: [(s at: 2) = 0].
	spelling setIgnoredWords: (OrderedCollection new).
	s := spelling checkSpellingOf: 'recieve' startingAt: 1.
	self should: [(s at: 1) = 1].
	self should: [(s at: 2) = 7].
	