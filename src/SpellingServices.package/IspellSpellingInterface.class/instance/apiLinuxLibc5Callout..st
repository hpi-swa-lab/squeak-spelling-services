primitive-callouts
apiLinuxLibc5Callout: aCommand
	<cdecl: long 'system' ( char* ) module: 'libc.so.5'>
	^ self externalCallFailed