primitive-callouts
apiMacOSXCallout: aCommand
	<cdecl: long 'system' (char*) module: 'libSystem.dylib'>
	| errCode |
	errCode := ExternalFunction getLastError.
	^ errCode = 13 "Unable to find function address. dylibs are not searched"
		ifTrue: [self error: 'Cannot call libSystem.dylib.
			Please set "SqueakPluginsBuiltInOrLocalOnly" in your VM''s Info.plist to false']
		ifFalse: [self externalCallFailed]