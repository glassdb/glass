testing
testMimeEncodeDecode

	| phrase encoded decoded |
	phrase := 'admin:pier'.
	encoded := (Base64MimeConverter mimeEncode: phrase readStream) contents.
	decoded := (Base64MimeConverter mimeDecodeToChars: encoded readStream) contents.
	self assert: decoded = phrase.
	decoded := (Base64MimeConverter mimeDecodeToBytes: encoded readStream) contents.
	self assert: decoded = phrase asByteArray.
	phrase := 'Hi There!'.
	encoded := Base64MimeConverter mimeEncode: phrase readStream.
	self assert: (encoded contents = 'SGkgVGhlcmUh').
     self assert: ((Base64MimeConverter mimeDecodeToChars: encoded) contents = phrase).