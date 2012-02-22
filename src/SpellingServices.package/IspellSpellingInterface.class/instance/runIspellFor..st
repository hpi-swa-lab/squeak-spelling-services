private-callouts
runIspellFor: aString
	| cmd outputFileName result |
	outputFileName := self class name, 'Output.txt'.
	FileDirectory default forceNewFileNamed: (self class name, '.txt') do: [:file |
		file nextPutAll: self ignoredWordsForIspell; nextPutAll: aString; crlf;
			close.
		cmd := self class commandTemplate format: {
					file name. self class binaryPath. self getLanguageString. outputFileName}.
		self callout: cmd.
		FileDirectory default
			fileNamed: outputFileName do: [:outputFile |
				result := outputFile contents.
				outputFile close];
			deleteFileNamed: outputFileName;
			deleteFileNamed: file localName].
	^ result lines allButFirst reject: #isEmpty
