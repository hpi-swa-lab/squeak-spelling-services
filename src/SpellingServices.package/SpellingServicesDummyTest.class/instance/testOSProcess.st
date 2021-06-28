as yet unclassified
testOSProcess

	Transcript showln: self.
	OSProcess waitForCommand: 'cmd.exe /c echo foo'