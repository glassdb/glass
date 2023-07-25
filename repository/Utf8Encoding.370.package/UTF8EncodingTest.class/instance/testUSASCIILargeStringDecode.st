testing
testUSASCIILargeStringDecode
	"Verify that for US-ASCII strings, the primDecoded string is identical to the original sample"
	
	| sample decoded |
	sample := self generateRandomUSASCIIString: 20000.
	self assert: sample _isLarge.
	self assert: sample class == String.
	decoded := self primEncodeDecode: sample.
	self deny: sample == decoded.
	self assert: decoded class == sample class.	
	decoded := self primEncodePrimDecode: sample.
	self assert: sample = decoded.
	decoded := self primEncodePrimDecodeDBS: sample.
	self assert: sample = decoded.
