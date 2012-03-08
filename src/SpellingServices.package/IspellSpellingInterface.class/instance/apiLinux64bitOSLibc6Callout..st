primitive-callouts
apiLinux64bitOSLibc6Callout: aCommand
	<cdecl: long 'system' ( char* ) module: '/lib32/libc.so.6'>
	^ self externalCallFailed