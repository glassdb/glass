testing
testNumericSuffix

	self assert: 'abc98' numericSuffix = 98.
	self assert: '98abc' numericSuffix = 0