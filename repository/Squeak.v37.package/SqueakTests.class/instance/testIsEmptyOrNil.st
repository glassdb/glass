testing
testIsEmptyOrNil

	self assert: nil isEmptyOrNil.
	self assert: #() isEmptyOrNil.
	self deny: {1. 2. 3} isEmptyOrNil.