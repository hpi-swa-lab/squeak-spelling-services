templates
nl

	^ Smalltalk os platformName asLowercase = 'win32'
		ifTrue: [String crlf]
		ifFalse: [String lf]
