testing
testAsHex


	self assert: String cr asHex asLowercase = '0d'.
	self assert: String lf asHex asLowercase = '0a'.
	self assert: 'A' asHex = '41'.
	self assert: 'AB' asHex = '4142'.
	self assert: 'abc' asHex = '616263'.