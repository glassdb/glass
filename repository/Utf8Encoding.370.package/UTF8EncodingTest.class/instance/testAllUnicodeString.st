testing
testAllUnicodeString
	"Generate a large Unicode32"
	
	| sample  |
	sample := self generateAllGsUnicodeString.
	self assert: sample _isLarge.
	self assert: sample class == Unicode32.
	self encodeDecode: sample.
	self encodePrimDecode: sample.
	self primEncodeDecode: sample.
	self primEncodePrimDecode: sample.
	self encodePrimDecodeDBS: sample.
	self primEncodePrimDecodeDBS: sample.
