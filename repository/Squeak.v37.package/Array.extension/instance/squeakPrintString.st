*squeak
squeakPrintString

	| aStream |
	aStream := WriteStream on: String new.
	aStream nextPut: $#.
	self printElementsOn: aStream.
	^aStream contents