testing
testBeginsWith

	| cArray quad prefix |
	self assert: ('abc' beginsWith: 'ab').
	cArray := {
		16rFF asCharacter.
		16rFF asCharacter.
		16rFF asCharacter.
		16rFF asCharacter.
		16rFFFFF asCharacter.
		16rFF asCharacter.
		16rFFFFF asCharacter.
		16rFF asCharacter.
		16rFFFFF asCharacter.
		16rFFFFF asCharacter.
	}.
	quad := QuadByteString new.
	prefix := QuadByteString new.
	cArray do: [:char | quad add: char ].
	1 to: 4 do: [:i | prefix add: (cArray at: i) ].
	self assert: (quad beginsWith: prefix).
	self assert: (quad beginsWith: prefix asOctetString).