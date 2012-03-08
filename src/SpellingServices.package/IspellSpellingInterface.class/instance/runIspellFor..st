private-callouts
runIspellFor: aString
	| cmd outputFileName result |
	outputFileName := self class name, 'Output.txt'.
	FileDirectory default forceNewFileNamed: (self class name, '.txt') do: [:file || outputFile |
		file nextPutAll: self ignoredWordsForIspell; nextPutAll: aString; nextPutAll: self class nl;
			close.
		outputFile := FileDirectory default fileNamed: outputFileName.
		cmd := self class commandTemplate format: {
					file name. self class binaryPath. self getLanguageString. outputFile name}.
		self callout: cmd.
		result := outputFile reopen; contents.
		FileDirectory default
			deleteFileNamed: outputFile localName;
			deleteFileNamed: file localName].
	^ result lines allButFirst reject: #isEmpty
