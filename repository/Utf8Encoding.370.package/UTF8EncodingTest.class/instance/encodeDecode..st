private
encodeDecode: sample

	| encoded decoded |
	encoded := UTF8Encoding encode: sample.
	self assert: encoded class = String.
	decoded := UTF8Encoding decode: encoded.
	self assert: decoded = sample.
	^decoded
