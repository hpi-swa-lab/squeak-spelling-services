primitive-callouts
callout: aCommand

	| callout result |
	(Smalltalk classNamed: 'OSProcess') ifNotNil: [:class |
		result := class waitForCommand: aCommand.
		self assert: result succeeded description: 'Callout failed!'.
		^ self].
	
	callout := self calloutDict
		at: Smalltalk os platformName asLowercase
		ifAbsent: [[:cmd | self error: 'Callouts not implemented for this platform!']].
	result := callout value: aCommand.
	self assert: result isZero description: ['Callout failed with exit code {1}!' format: {result}].