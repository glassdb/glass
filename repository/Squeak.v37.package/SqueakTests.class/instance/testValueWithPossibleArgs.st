testing
testValueWithPossibleArgs

	| bool |
	bool := true.
	self assert: ([true] valueWithPossibleArgs: #()).
	self assert: ([bool] valueWithPossibleArgs: #()).
	self assert: ([:a1 :a2 | bool] valueWithPossibleArgs: {false. false.}).
	self assert: ([:a1 :a2 | a1] valueWithPossibleArgs: {true. true.}).
	self assert: ([:a1 :a2 :a3 :a4 | a4 == nil] valueWithPossibleArgs: {false. false.}).