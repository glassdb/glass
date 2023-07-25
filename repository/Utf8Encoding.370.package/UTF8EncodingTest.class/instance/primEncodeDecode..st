private
primEncodeDecode: sample

	|  encoded decoded |
	encoded := sample encodeAsUTF8.
	self assert: encoded class = Utf8.
	decoded := UTF8Encoding decode: encoded.
	self assert: decoded = sample.
	^decoded
