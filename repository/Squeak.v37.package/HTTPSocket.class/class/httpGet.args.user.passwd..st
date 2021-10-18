get
httpGet: url args: args user: user passwd: passwd
	| authorization |
	authorization _ (self mimeConverterClass mimeEncode: (user , ':' , passwd) readStream) contents.
	^self 
		httpGet: url args: args accept: '*/*' 
		request: 'Authorization: Basic ' , authorization , CrLf