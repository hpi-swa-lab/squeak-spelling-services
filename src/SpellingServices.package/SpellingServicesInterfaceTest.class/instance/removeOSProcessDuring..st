as yet unclassified
removeOSProcessDuring: aBlock

	| class environment |
	environment := self environment.
	class := (environment classNamed: #OSProcess) ifNil: [^ aBlock value].
	
	(environment instVarNamed: 'declarations') removeKey: #OSProcess.
	^ aBlock ensure: [
		(environment instVarNamed: 'declarations') at: #OSProcess put: class]