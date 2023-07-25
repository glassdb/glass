testing
testRandomUSASCIIString
	
	| sample decoded |
	sample := self generateRandomUSASCIIString: 2000.
	self deny: sample _isLarge.
	self assert: sample class == String.
	self encodeDecode: sample.
	self encodePrimDecode: sample.
	self primEncodeDecode: sample.
	self primEncodePrimDecode: sample.
	self encodePrimDecodeDBS: sample.
	self primEncodePrimDecodeDBS: sample.
