as yet unclassified
testOSProcess2

	Transcript showln: self.
	Transcript showln: ((Process allInstances reject: #isTerminated) collect: [:ea | ea -> ea isSuspended]).
	OSProcess waitForCommand: 'cmd.exe //c echo foo'