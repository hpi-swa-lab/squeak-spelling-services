instance creation
new

	^ (Smalltalk os platformName asLowercase = 'mac os'
		ifTrue: [MacSpellingInterface]
		ifFalse: [IspellSpellingInterface])
			basicNew
			initialize;
			yourself