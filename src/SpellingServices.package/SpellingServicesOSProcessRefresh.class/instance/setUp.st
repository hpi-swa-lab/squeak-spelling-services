running
setUp

	super setUp.
	
	OSProcess isWindows ifTrue: [
		OSProcessAccessor initialize].