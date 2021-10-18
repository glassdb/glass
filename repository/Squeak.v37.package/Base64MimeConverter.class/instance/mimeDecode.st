conversion
mimeDecode
	"Convert a stream in base 64 with only a-z,A-Z,0-9,+,/ to a full byte stream of characters.  Reutrn a whole stream for the user to read."

	| nibA nibB nibC nibD |
	[mimeStream atEnd] whileFalse: [
		(nibA _ self nextValue) ifNil: [^ dataStream].
		(nibB _ self nextValue) ifNil: [^ dataStream].
		dataStream nextPut: ((nibA bitShift: 2) + (nibB bitShift: -4)) asCharacter.
		nibB _ nibB bitAnd: 16rF.
		(nibC _ self nextValue) ifNil: [^ dataStream].
		dataStream nextPut: ((nibB bitShift: 4) + (nibC bitShift: -2)) asCharacter.
		nibC _ nibC bitAnd: 16r3.
		(nibD _ self nextValue) ifNil: [^ dataStream].
		dataStream nextPut: ((nibC bitShift: 6) + nibD) asCharacter.
		].
	^ dataStream