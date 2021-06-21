ignored words
getIgnoredWords

	^ IgnoredWords ifNil: [IgnoredWords := OrderedCollection new]