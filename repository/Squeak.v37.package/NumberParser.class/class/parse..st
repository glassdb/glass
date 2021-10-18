instance creation
parse: aStringOrStream 
	^(self defaultParserClass new)
		on: aStringOrStream;
		nextNumber