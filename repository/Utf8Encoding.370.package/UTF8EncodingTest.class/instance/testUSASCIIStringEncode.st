testing
testUSASCIIStringEncode
	"Verify that for US-ASCII strings, the primEncoded string is identical to the original sample"
	
	| sample encoded |
	sample := self generateRandomUSASCIIString: 2000.
	self deny: sample _isLarge.
	self assert: sample class == String.
	encoded := sample encodeAsUTF8.
	self assert: sample = encoded
