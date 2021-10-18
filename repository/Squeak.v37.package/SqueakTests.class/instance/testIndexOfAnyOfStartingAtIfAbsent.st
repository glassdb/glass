testing
testIndexOfAnyOfStartingAtIfAbsent

	| bArray cArray quad prefix |
	bArray := {$f asciiValue. $d asciiValue } asByteArray.
	self assert: ('abcd' indexOfAnyOf: bArray  startingAt: 1 ifAbsent: [self assert: false ]) = 4.
	self assert: ('ghijk' indexOfAnyOf: bArray  startingAt: 1 ifAbsent: [ true ]).
	cArray := {
		16rFFFFF asCharacter.
		16rFFFFF asCharacter.
		16rFFFFF asCharacter.
		16rFF asCharacter.
		16rFFFFF asCharacter.
		16rFFFFF asCharacter.
		16rFFFFF asCharacter.
		16rFFFFF asCharacter.
	}.
	quad := QuadByteString new.
	prefix := QuadByteString new.
	cArray do: [:char | quad add: char ].
	1 to: 4 do: [:i | prefix add: (cArray at: i) ].
	bArray := {16rFF. 16rF } asByteArray.
	self assert: (quad indexOfAnyOf: bArray  startingAt: 1 ifAbsent: [self assert: false ]) = 4.
	bArray := {16rEF. 16rE } asByteArray.
	self assert: (quad indexOfAnyOf: bArray  startingAt: 1 ifAbsent: [ true ]).