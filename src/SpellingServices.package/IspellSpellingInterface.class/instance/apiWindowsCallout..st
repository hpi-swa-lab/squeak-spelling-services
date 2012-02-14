primitive-callouts
apiWindowsCallout: aCommand
	<apicall: long 'system' ( char* ) module: 'msvcrt.dll'>
	^ self externalCallFailed