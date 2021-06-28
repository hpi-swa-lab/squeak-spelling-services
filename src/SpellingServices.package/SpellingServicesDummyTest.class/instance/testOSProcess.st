as yet unclassified
testOSProcess

	Transcript showln: self.
	Transcript showln: ((Process allInstances reject: #isTerminated) collect: [:ea | ea -> ea isSuspended]).
	OSProcess waitForCommand: 'cmd.exe /c echo foo'