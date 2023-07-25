testing
testDoubleByteLargeStringDecode
	"Verify that for double byte strings, the primDecoded string is of class Unicode16"
	
	| sample decoded |
	sample := self generateRandomDoubleByteString: 20000.
	self assert: sample _isLarge.
	self assert: sample class == Unicode16.
	decoded := self primEncodePrimDecode: sample.
	self assert: decoded class == Unicode16.
	decoded := self primEncodePrimDecodeDBS: sample.
	self assert: decoded class == Unicode16.
