testing
testStringEncode

	| sample encoded |
	sample := '12', self string1.
	encoded := UTF8Encoding encode: sample.
	self assert: encoded = ((String with: 49 asCharacter with: 50 asCharacter), self string1Encoded)
