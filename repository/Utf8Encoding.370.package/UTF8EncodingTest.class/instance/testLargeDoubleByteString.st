testing
testLargeDoubleByteString
	
	| sample decoded |
	sample := self generateRandomDoubleByteString: 20000.
	self assert: sample _isLarge.
	self assert: sample class == Unicode16.
	self encodeDecode: sample.
	self encodePrimDecode: sample.
	self encodePrimDecodeDBS: sample.
	self primEncodeDecode: sample.
	decoded := self primEncodePrimDecodeDBS: sample.
	self assert: decoded class == Unicode16.
	decoded := self primEncodePrimDecode: sample.
	self assert: decoded class == Unicode16.
