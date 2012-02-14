utility
waitASecondRollOver
	| now duration |
	now := Time  millisecondClockValue.
	[duration := (Time  millisecondClockValue) - now.
	duration > 0]
		whileFalse: [(Delay forMilliseconds: 10) wait].
	^Time  millisecondClockValue printString