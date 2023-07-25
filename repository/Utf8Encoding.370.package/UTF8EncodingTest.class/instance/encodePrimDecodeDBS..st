private
encodePrimDecodeDBS: sample

	| encoded decoded |
	encoded := UTF8Encoding encode: sample.
	self assert: encoded class = String.
	decoded := encoded decodeFromUTF8.
	self assert: decoded = sample.
	^decoded
