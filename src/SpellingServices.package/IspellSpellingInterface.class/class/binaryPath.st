preferences
binaryPath
	<preference: 'I/A/Spell binary path'
		category: 'Spelling Interface'
		description: 'Set the path of the binary to be used for spelling. Has to be ispell compatible.'
		type: #String>
	^ BinaryPath ifNil: ['ispell']
