private-callouts
runIspellFor: aString
	| file cmd fileName outputFileName result |
	fileName := self class name, '.txt'.
	outputFileName := self class name, 'Output.txt'.
	file := (FileDirectory default forceNewFileNamed: fileName).
	file
		nextPutAll: self ignoredWordsForIspell;
		nextPutAll: aString;
		lf;
		flush.
	cmd := String streamContents: [:stream |
		stream
			nextPutAll: 'cat ';
			nextPutAll: fileName;
			space;
			nextPut: $|;
			space;
			nextPut: $";
			nextPutAll: self class binaryPath;
			nextPut: $";
			nextPutAll: ' -a -f ';
			nextPutAll: outputFileName].
	self callout: cmd.
	FileDirectory default deleteFileNamed: fileName.
	result := (FileDirectory default fileNamed: outputFileName) contents.
	FileDirectory default deleteFileNamed: outputFileName.
	^ result lines allButFirst
	