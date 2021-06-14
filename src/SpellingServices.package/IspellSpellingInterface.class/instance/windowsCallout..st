primitive-callouts
windowsCallout: aCommand
	"Escape newlines for Windows CmdLine"
	| escapedCommand |
	escapedCommand := ((aCommand
								copyReplaceAll: Character cr asString with: ' ')
								copyReplaceAll: Character lf asString with: ' ').
	self apiWindowsCallout: escapedCommand.