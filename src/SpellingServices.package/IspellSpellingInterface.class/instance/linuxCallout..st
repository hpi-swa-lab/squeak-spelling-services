primitive-callouts
linuxCallout: aCommand
	"Try with new libc6 and older libc5"

	[ self apiLinuxLibc6Callout: aCommand ]
		on: Error
		do: [ 
			[ self apiLinuxLibc5Callout: aCommand ]
				on: Error
				do: [ 
					[ self apiLinux64bitOSLibc6Callout: aCommand ]
						on: Error
						do: [ self apiLinux64bitOSLibc5Callout: aCommand ] ] ]