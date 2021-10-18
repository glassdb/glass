creating patches
incorporateAddsInto: aPatchSequence
	"Incorporate adds"
	| lastMatch lastIndex index |
	added ifNil:[^self].
	added := added sortBy:[:a1 :a2| a1 key < a2 key].
	lastMatch := 1.
	lastIndex := 0.
	1 to: added size do:[:i|
		index := (added at: i) key.
		[index > lastMatch] whileTrue:[
			[lastIndex := lastIndex + 1.
			(aPatchSequence at: lastIndex) key == #match] whileFalse.
			lastMatch := lastMatch + 1.
		].
		aPatchSequence add: #insert->(added at: i) value afterIndex: lastIndex.
		lastIndex := lastIndex + 1.
		lastMatch := lastMatch + 1.
	].