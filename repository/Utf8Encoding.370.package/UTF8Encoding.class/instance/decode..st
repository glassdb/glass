API
decode: aString
	"^<String> precise String subclass will vary according to character size"

	| decoded encoded character |
    decoded := WriteStream on: String new.
    encoded := aString readStream.
	[ (character := self nextFrom: encoded) notNil ]
			whileTrue: [ decoded nextPut: character ].
    ^decoded contents
