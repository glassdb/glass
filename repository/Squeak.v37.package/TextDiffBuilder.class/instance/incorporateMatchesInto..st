creating patches
incorporateMatchesInto: aPatchSequence
	"Incorporate matches"
	| index |
	runs associationsDo:[:assoc|
		index := assoc key y.
		assoc value do:[:line|
			self assert:[(aPatchSequence at: index) isNil].
			aPatchSequence at: index put: (#match -> line).
			index := index + 1.
		].
	].