testing
testCopyFrom

	| assoc1 assoc2 |
	assoc1 := 1 -> 2.
	self assert: assoc1 key == 1.
	self assert: assoc1 value == 2.
	assoc2 := 3 -> 4.
	self assert: assoc2 key == 3.
	self assert: assoc2 value == 4.
	assoc1 copyFrom: assoc2.
	self assert: assoc1 key == 3.
	self assert: assoc1 value == 4.