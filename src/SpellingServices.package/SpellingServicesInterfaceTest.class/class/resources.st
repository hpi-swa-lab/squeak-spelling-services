accessing
resources

	| resources |
	resources := super resources.
	
	(self environment classNamed: #OSProcess) ifNotNil: [:class |
		resources := resources copyWith: SpellingServicesOSProcessRefresh].
	
	^ resources