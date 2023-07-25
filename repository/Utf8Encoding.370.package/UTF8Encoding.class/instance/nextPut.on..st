accessing
nextPut: aCharacter on: aStringStream
	"Encode aCharacter and write it on the String stream"
	"self new displayEncodingOf: 16r2013"

	^self nextPutCodePoint: aCharacter asInteger on: aStringStream
