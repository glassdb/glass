testing
testValueWithPossibleArgument

	| bool |
	bool := true.
	self assert: ([true] valueWithPossibleArgument: true).
	self assert: ([bool] valueWithPossibleArgument: true).
	self assert: ([:a1 :a2 | bool] valueWithPossibleArgument: true).
	self assert: ([:a1 :a2 | a1] valueWithPossibleArgument: true).
	self assert: ([:a1 :a2 :a3 :a4 | a2 == nil and: [a1]] valueWithPossibleArgument: true).