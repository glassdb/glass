testing
testWithSqueakLineEndings

	| stream str str1 str2 |
	stream := WriteStream on: String new.
	stream 
		nextPutAll: 'abc'; 
		nextPut: Character cr; 
		lf; 
		nextPutAll: 'def'.
	str := stream contents.
	stream := WriteStream on: String new.
	stream 
		nextPutAll: 'abc'; 
		nextPut: Character cr; 
		nextPutAll: 'def'.
	self assert: (str withSqueakLineEndings) = (stream contents).
	str1 := QuadByteString new.
	{
		16rFF asCharacter.
		16rFF asCharacter.
		16rFF asCharacter.
		16rFF asCharacter.
		16rFFFFF asCharacter.
	} do: [:char | str1 add: char ].
	str2 := QuadByteString new.
	{	16rFF asCharacter.
		16rFFFFF asCharacter.
		16rFF asCharacter.
		16rFFFFF asCharacter.
		16rFFFFF asCharacter.
	} do: [:char | str2 add: char ].
	stream := WriteStream on: QuadByteString new.
	stream 
		nextPutAll: str1; 
		nextPut: Character cr; 
		lf; 
		nextPutAll: str2.
	str := stream contents.
	stream := WriteStream on: QuadByteString new.
	stream 
		nextPutAll: str1; 
		nextPut: Character cr; 
		nextPutAll: str2.
	self assert: (str withSqueakLineEndings) = (stream contents).