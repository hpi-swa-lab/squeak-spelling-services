baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"dependencies"
		spec project: 'FFI' with: [
			spec
				className: 'ConfigurationOfFFI';
				repository: 'http://www.squeaksource.com/MetacelloRepository';
				versionString: (SystemVersion current isAlpha
					ifTrue: [#development]
					ifFalse: [#stable]);
				loads: #('Core')].
		
		"packages"
		spec
			package: 'SpellingServices' with: [
				spec requires: 'FFI'].
		
		"groups"
		spec
			group: #default with: #('SpellingServices')].