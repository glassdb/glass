testing
testLargeString
	"Generate a large Unicode32"
	
	| sample decoded |
	sample := self generateRandomString: 20000.
	self assert: sample _isLarge.
	self assert: sample class == Unicode32.
	self encodeDecode: sample.
	decoded := self encodePrimDecode: sample.
	self assert: decoded class == Unicode32.
	self primEncodeDecode: sample.
	self primEncodePrimDecode: sample.
	self encodePrimDecodeDBS: sample.
	self primEncodePrimDecodeDBS: sample.
