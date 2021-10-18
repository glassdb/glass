testing
testEndsWith

	| cArray quad suffix |
	self assert: ('abc' endsWith: 'bc').
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
	suffix := QuadByteString new.
	cArray do: [:char | quad add: char ].
	7 to: cArray size do: [:i | suffix add: (cArray at: i) ].
	self assert: (quad endsWith: suffix).
	self assert: (quad endsWith: suffix asOctetString).