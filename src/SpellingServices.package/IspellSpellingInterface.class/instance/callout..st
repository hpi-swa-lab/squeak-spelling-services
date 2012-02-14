primitive-callouts
callout: aCommand

	^ (Smalltalk classNamed: 'OSProcess')
		ifNil: [(self calloutDict
				at: SmalltalkImage current platformName asLowercase
				ifAbsent: [[:cmd | self error: 'Callouts not implemented for this platform!']])
					value: aCommand]
		ifNotNilDo: [:class | class waitForCommand: aCommand].