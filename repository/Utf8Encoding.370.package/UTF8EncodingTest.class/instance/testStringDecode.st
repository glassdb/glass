testing
testStringDecode

	| decoded |
	decoded := UTF8Encoding decode: self string1Encoded.
	self assert: decoded = self string1
