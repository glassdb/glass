testing
testUSASCIILargeStringEncode
	"Verify that for US-ASCII strings, the primEncoded string is identical to the original sample"
	
	| sample encoded |
	sample := self generateRandomUSASCIIString: 20000.
	self assert: sample _isLarge.
	self assert: sample class == String.
	encoded := sample encodeAsUTF8.
	self assert: sample = encoded
