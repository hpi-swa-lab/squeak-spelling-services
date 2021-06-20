primitive-callouts
apiLinuxLibc6Callout: aCommand
	<cdecl: long 'system' ( char* ) module: 'libc.so.6'>
	^ self externalCallFailed