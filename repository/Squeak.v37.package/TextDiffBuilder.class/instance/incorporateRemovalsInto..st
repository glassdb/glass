creating patches
incorporateRemovalsInto: aPatchSequence
	"Incorporate removals"
	| index |
	removed ifNil:[^self].
	removed do:[:assoc|
		index := assoc key.
		self assert:[(aPatchSequence at: index) isNil].
		aPatchSequence at: index put: #remove -> assoc value.
	].