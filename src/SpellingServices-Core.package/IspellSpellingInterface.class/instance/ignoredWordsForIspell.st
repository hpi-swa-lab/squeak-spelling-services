ignored words
ignoredWordsForIspell

	^ String streamContents: [:stream |
		self getIgnoredWords do: [:word |
			stream
				nextPut: self ignoreToken;
				nextPutAll: word;
				nextPutAll: self class nl]]