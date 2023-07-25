private
string1Encoded

	| stream |
    stream := WriteStream on: String new.

	#(97 98 226 128 147 226 130 172 197 161 196 141) do: [ :each |
			stream nextPut: each asCharacter ].
    ^stream contents
