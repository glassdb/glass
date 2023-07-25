private
primEncodePrimDecodeDBS: sample

	|  encoded decoded |
	encoded := sample encodeAsUTF8.
	self assert: encoded class = Utf8.
	decoded := encoded decodeFromUTF8.
	self assert: decoded = sample.
	^decoded
