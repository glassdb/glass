testing
testString1

	| sample |
	sample := self string1.
	self encodeDecode: sample.
	self encodePrimDecode: sample.
	self primEncodeDecode: sample.
	self primEncodePrimDecode: sample.
	self encodePrimDecodeDBS: sample.
	self primEncodePrimDecodeDBS: sample.
