testing
testInstVarNamedPut

	| assoc |
	assoc := 1 -> 2.
	self assert: assoc key == 1.
	self assert: assoc value == 2.
	assoc instVarNamed: 'value' put: 3.
	self assert: assoc value == 3.