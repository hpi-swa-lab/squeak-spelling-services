primitive-callouts
callout: aCommand

	| callout result |
	(self environment classNamed: #OSProcess) ifNotNil: [:class | | command |
		command := aCommand.
		Smalltalk os platformName asLowercase = 'win32' ifTrue: [
			self flag: #win32. "OSProcess currently does not support pipes and redirects for Win32."
			command := 'cmd.exe /c {1}' format: {command}.
			(class waitForCommand: 'uname') succeeded ifTrue: [
				self flag: #mingw. "When run from mingw, '/c' will be interpreted as a drive letter unless the next argument is in quotes..."
				command := 'cmd.exe /c "{1}"' format: {command copyWithRegex: '(?=["\\])' matchesReplacedWith: '\'}]].
		result := class waitForCommand: command.
		self assert: result succeeded description: 'Callout failed!'.
		^ self].
	
	callout := self calloutDict
		at: Smalltalk os platformName asLowercase
		ifAbsent: [[:cmd | self error: 'Callouts not implemented for this platform!']].
	result := callout value: aCommand.
	self assert: result isZero description: ['Callout failed with exit code {1}!' format: {result}].