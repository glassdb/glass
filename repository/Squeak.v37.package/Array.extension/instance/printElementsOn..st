*squeak
printElementsOn: aStream
	aStream nextPut: $(.
	self do: [:element | aStream nextPutAll: element squeakPrintString; space].
	self isEmpty ifFalse: [aStream skip: -1].
	aStream nextPut: $)