*squeak
to: aCharacter
	"Answer with a collection in ascii order -- $a to: $z"

	^(self asInteger to: aCharacter asInteger) collect: [:ea | (Character withValue: ea)].