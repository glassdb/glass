accessing
nextFrom: aByteStream
	"^<Character>
	Decode the next byte(s) from the encoded stream, and answer the character.
	This is the reverse of #nextPut:on: -- 	see the class comment for explanation."

	| code |
	aByteStream atEnd
		ifTrue: [ ^nil ].
	self nextBytesFrom: aByteStream do: [ :byte1code :sizeInBytes |
		code := byte1code.
		sizeInBytes - 1 timesRepeat: [
			code := (code bitShift: 6) + ((self nextByteFrom: aByteStream) bitAnd: 2r00111111) ] ].
	^Character withValue: code
