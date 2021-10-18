testing
testUnescapePercents

	| str encoded |
	str := String new.
	{ 16rFF. 16rA. } do: [:byte | str add: byte asCharacter ].
	encoded := str copy encodeForHTTP.
	self assert: encoded unescapePercents = str.