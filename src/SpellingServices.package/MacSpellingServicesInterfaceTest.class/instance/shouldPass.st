testing
shouldPass

	self isMacOS ifTrue: [
		self flag: #todo. "Apparently SpellingPlugin does not work any longer; at least, so says the CI. Hey you Mac user who are reading this right now, yeah, exactly you, would you mind to take a look at this and tell us whether this assumption was correct? Short note on squeak-dev/vm-dev or an issue under https://github.com/hpi-swa-lab/squeak-spelling-services would be highly appreciated!"
		^ false].
	
	^ super shouldPass