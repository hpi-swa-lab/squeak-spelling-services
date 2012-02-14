ignored words
ignoredWordsForIspell

	^ String streamContents: [:stream |
		self getIgnoredWords do: [:word |
			stream
				nextPut: $@; "Accept-word-from-now-on-character"
				nextPutAll: word;
				lf]]