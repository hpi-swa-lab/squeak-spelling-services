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
			package: 'SpellingServices-Core';
			package: 'SpellingServices-Tests' with: [
				spec requires: 'SpellingServices-Core']].
		
		"groups"
		spec
			group: #core with: #('SpellingServices-Core');
			group: #default with: #(core tests);
			group: #tests with: #('SpellingServices-Tests').