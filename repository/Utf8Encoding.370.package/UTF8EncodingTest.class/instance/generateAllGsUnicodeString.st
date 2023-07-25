private
generateAllGsUnicodeString
	"selected ranges throughout Unicode set"

	| string encoder encodingBlock|
	string := String new.
	encoder := UTF8Encoding new.
    encodingBlock := [:codePoint | | encoding |
		"Skip all codePoints for which there is no legal UTF8 representation"
		(encoder isLegalUtf8Cp: codePoint )
			ifTrue: [
				self checkEncoding: codePoint using: encoder.
				encoding := encoder encodingOf: codePoint.
				string add: codePoint asCharacter]].
	0 to: 16rFFFF do: encodingBlock.        "original 2 byte range"
	16r10000 to: 16r1FFFF do: encodingBlock.  
	16rF0000 to: 16rFFFFF do: encodingBlock.  
	16r100000 to: 16r10FFFF do: encodingBlock.  
	^string copy "avoid GemStone internal side effects caused by growing the String"
