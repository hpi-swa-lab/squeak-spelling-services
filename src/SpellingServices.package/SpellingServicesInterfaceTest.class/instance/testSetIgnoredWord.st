tests
testSetIgnoredWord
	|  w1 i2 i2strings w2 w3 |

	w1 := self waitASecondRollOver.
	spelling setIgnoredWord: w1.
	i2 := spelling getIgnoredWords.
	i2strings := i2 collect: [:e | e asString].
	self should: [i2strings includes: w1].

	w2 := self waitASecondRollOver.
	spelling setIgnoredWord: w2.
	i2 := spelling getIgnoredWords.
	i2strings := i2 collect: [:e | e asString].
	self should: [i2strings includes: w1].
	self should: [i2strings includes: w2].
	
	spelling setIgnoredWords: (OrderedCollection new).
	w3 := self waitASecondRollOver.
	spelling setIgnoredWord: w3.
	i2 := spelling getIgnoredWords.
	self should: [i2 size = 1].
	i2strings := i2 collect: [:e | e asString].
	self should: [i2strings includes: w3].

