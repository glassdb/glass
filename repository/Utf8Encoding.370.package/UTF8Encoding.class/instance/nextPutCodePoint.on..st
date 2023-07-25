accessing
nextPutCodePoint: code on: aStringStream
	"Encode aCharacter and write it on the byte stream.
	See the class comment for an explanation of this method.
	On most platforms, aCharacter is currently expected to have an integer 
	value < 65535 and the number of bytes written is 1, 2, or 3."
	"self new displayEncodingOf: 16r2013"

	| sizeInBytes firstByteSignature laterByteSignature shift |
	sizeInBytes := self sizeOf: code.
	sizeInBytes = 1 ifTrue: [
			aStringStream nextPut: (Character withValue: code).
			^self ].

	firstByteSignature := #(2r11000000 2r11100000 2r11110000 2r11111000 2r11111100) at: sizeInBytes - 1.
	laterByteSignature := 2r10000000.
	shift := sizeInBytes - 1 * -6.
	aStringStream nextPut: (Character withValue: (code bitShift: shift) + firstByteSignature).
	2 to: sizeInBytes do: [ :index |
		shift := shift + 6.
		aStringStream nextPut: (Character withValue: ((code bitShift: shift) bitAnd: 2r00111111) + laterByteSignature) ]
