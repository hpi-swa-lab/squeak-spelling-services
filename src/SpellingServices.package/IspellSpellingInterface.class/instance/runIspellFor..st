private-callouts
runIspellFor: aString

	| directory inputFileName outputFileName cmd result |
	directory := FileDirectory default.
	inputFileName := directory fullPathFor: self class name, 'Input.txt'.
	outputFileName := directory fullPathFor: self class name, 'Output.txt'.
	cmd := self class commandTemplate format: {
		inputFileName. self class binaryPath. self getLanguageString. outputFileName}.
	
	result := [
		FileStream forceNewFileNamed: inputFileName do: [:inputFile |
			inputFile
				nextPutAll: self ignoredWordsForIspell;
				nextPutAll: aString;
				nextPutAll: self class nl].
		
		self callout: cmd.
		
		FileStream readOnlyFileNamed: outputFileName do: [:outputFile |
			outputFile contents]
	] ensure: [
		FileDirectory default
			deleteFileNamed: inputFileName;
			deleteFileNamed: outputFileName].
	^ result lines allButFirst reject: #isEmpty