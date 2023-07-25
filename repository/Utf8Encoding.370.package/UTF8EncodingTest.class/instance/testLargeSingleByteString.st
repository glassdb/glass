testing
testLargeSingleByteString
	
	| sample decoded |
	sample := self generateRandomSingleByteString: 20000.
	self assert: sample _isLarge.
	self assert: sample class == String.
	self encodeDecode: sample.
	self encodePrimDecode: sample.
	self primEncodeDecode: sample.
	decoded := self primEncodePrimDecode: sample.
    self assert: decoded class == Unicode16.
