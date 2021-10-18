instance creation
parse: aStringOrStream onError: failBlock 
	^(self defaultParserClass new)
		on: aStringOrStream;
		failBlock: failBlock;
		nextNumber