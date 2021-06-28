templates
commandTemplate

	^ Smalltalk platformName asLowercase = 'win32'
		ifTrue: ['type "{1}" | "{2}" -a -d {3} > "{4}"']
		ifFalse: ['cat "{1}" | "{2}" -a -d {3} > "{4}"']