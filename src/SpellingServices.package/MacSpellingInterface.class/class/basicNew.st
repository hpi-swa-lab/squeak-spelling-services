instance creation
basicNew

	^ [super basicNew
		primGetLanguage;
		yourself] on: Error do: [
			"Spelling plugin seems to be unavailable, use Ispell"
			IspellSpellingInterface basicNew]