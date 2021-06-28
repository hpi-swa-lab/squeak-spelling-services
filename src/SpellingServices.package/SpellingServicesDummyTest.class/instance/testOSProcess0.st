as yet unclassified
testOSProcess0

	Transcript showln: self.
	Transcript showln: ((Process allInstances reject: #isTerminated) collect: [:ea | ea -> ea isSuspended]).
	OSProcess waitForCommand: 'whoami'