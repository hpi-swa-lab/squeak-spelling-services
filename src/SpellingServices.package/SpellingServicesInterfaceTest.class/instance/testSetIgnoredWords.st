tests
testSetIgnoredWords
	|  w1 i i2 i3 i3strings i1strings i2strings |
	i := spelling getIgnoredWords.
	i isEmpty ifTrue: [
		spelling setIgnoredWords: (OrderedCollection with: 'ackbar').
		i2 := spelling getIgnoredWords.
		self should: [i2 size = 1].
		self should: [(i2 at: 1) asString = 'ackbar'].
		spelling setIgnoredWords: (OrderedCollection with: 'ackbar' with: 'ackbar2').
		i3 := spelling getIgnoredWords.
		self should: [i3 size = 2].
		i3strings := i3 collect: [:e | e asString].
		self should: [i3strings includes: 'ackbar'].
		self should: [i3strings includes: 'ackbar2']	
	].
	i := spelling getIgnoredWords.
	w1 := self waitASecondRollOver.
	i1strings := i collect: [:e | e asString].
	i1strings add: w1.
	spelling setIgnoredWords: i1strings.
	i2 := spelling getIgnoredWords.
	i2strings := i2 collect: [:e | e asString].
	self should: [i2strings includes: w1].
	spelling setIgnoredWords: (OrderedCollection new).
	i := spelling getIgnoredWords.
	self should: [i size = 0].


