primitive-callouts
calloutDict

	CalloutDict ifNil: [CalloutDict := Dictionary newFrom: {
										'unix' -> [:cmd | self linuxCallout: cmd].
										'win32' -> [:cmd | self windowsCallout: cmd].
										'mac os' -> [:cmd | self apiMacOSXCallout: cmd]}].
	^ CalloutDict