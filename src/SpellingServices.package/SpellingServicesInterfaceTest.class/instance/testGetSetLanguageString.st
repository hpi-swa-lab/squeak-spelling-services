tests
testGetSetLanguageString
	| l remember |
	l := spelling getLanguageString.
	self should: [l size > 0].
	remember := l.
	spelling setLanguageString: l.
	l := spelling getLanguageString.
	self should: [l size > 0].
	self should: [remember = l].

	