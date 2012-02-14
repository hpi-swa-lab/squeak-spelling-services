instance creation
new

	^ (SmalltalkImage current platformName asLowercase = 'mac os'
		ifTrue: [MacSpellingInterface]
		ifFalse: [IspellSpellingInterface])
			basicNew
			initialize;
			yourself