testing
testBase64MimeConferterEncodeDecode


	1 to: 1000 do: [:i |
		self assert: (Base64MimeConverter decodeInteger: (Base64MimeConverter encodeInteger: i)) == i ].