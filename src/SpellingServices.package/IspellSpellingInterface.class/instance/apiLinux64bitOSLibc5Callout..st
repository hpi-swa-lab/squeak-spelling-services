primitive-callouts
apiLinux64bitOSLibc5Callout: aCommand
	<cdecl: long 'system' ( char* ) module: '/lib32/libc.so.5'>
	^ self externalCallFailed