private
checkEncoding: codePoint using: encoder

	| a b |
	a := (encoder encode: codePoint asCharacter asString) asByteArray.
	b := codePoint asCharacter asString encodeAsUTF8 asByteArray.
	self assert: a = b.
