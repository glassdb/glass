API
encodingOf: aCodePoint
	"^<aString>"
	"self new encodingOf: 16r2013"

    | stream |
	stream := WriteStream on:String new.
	self nextPut: aCodePoint asCharacter on: stream.
    ^stream contents
