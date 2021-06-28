primitive-callouts
callout: aCommand

	| callout result |
	(self environment classNamed: #OSProcess) ifNotNil: [:class | | command |
		command := aCommand.
		Smalltalk os platformName asLowercase = 'win32' ifTrue: [
			self flag: #win32. "OSProcess currently does not support pipes and redirects for Win32."
			(class waitForCommand: 'cmd.exe /c "\"uname\""') exitStatus = 0 ifFalse: [
				self flag: #mingw. "Apparently we are running from mingw. Enclosed the command within quotes; otherwise, bash would convert the '/c' to 'C:\' and start an interactive shell. Subsequently, escape all quote characters in the command."
				command := '"{1}"' format: {command copyWithRegex: '(?=["\\])' matchesReplacedWith: '\'}].
			command := 'cmd.exe /c {1}' format: {command}].
		result := class waitForCommand: command.
		self assert: result succeeded description: 'Callout failed!'.
		^ self].
	
	callout := self calloutDict
		at: Smalltalk os platformName asLowercase
		ifAbsent: [[:cmd | self error: 'Callouts not implemented for this platform!']].
	result := callout value: aCommand.
	self assert: result isZero description: ['Callout failed with exit code {1}!' format: {result}].