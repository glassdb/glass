testing
testRandomSingleByteString
	
	| sample decoded |
	sample := self generateRandomSingleByteString: 2000.
	self deny: sample _isLarge.
	self assert: sample class == String.
	self encodeDecode: sample.
	self encodePrimDecode: sample.
	self encodePrimDecodeDBS: sample.
	self primEncodeDecode: sample.
	decoded := self primEncodePrimDecodeDBS: sample.
    self assert: decoded class == Unicode16.
	decoded := self primEncodePrimDecode: sample.
    self assert: decoded class == Unicode16.
