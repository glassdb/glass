testing
testIfNotNil

	self assert: (nil ifNotNil: []) == nil.
	self assert: (1 ifNotNil: []) == nil.
	self assert: (1 ifNotNil: [2]) == 2.
	self assert: (1 ifNotNil: [:one | one ]) == 1.
	self assert: (nil ifNotNil: [:one | one ]) == nil.