running
setUp

	super setUp.
	
	OSProcess isWindows ifTrue: [
		self flag: #workaround. "Without this line, spooky things will happen when the VM is restarted from SmalltalkCI/mingw, causing OSProcess to time out on any further request. See http://lists.squeakfoundation.org/pipermail/squeak-dev/2021-June/215898.html for further information."
		OSProcessAccessor initialize].