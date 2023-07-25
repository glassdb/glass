testing
testLargeUSASCIIString
	
	| sample decoded |
	sample := self generateRandomUSASCIIString: 20000.
	self assert: sample _isLarge.
	self assert: sample class == String.
	self encodeDecode: sample.
	self encodePrimDecode: sample.
	self primEncodeDecode: sample.
	self primEncodePrimDecode: sample.
	self encodePrimDecodeDBS: sample.
	self primEncodePrimDecodeDBS: sample.
