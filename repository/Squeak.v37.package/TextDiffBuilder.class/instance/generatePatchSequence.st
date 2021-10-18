creating patches
generatePatchSequence
	| ps |
	ps := OrderedCollection new: srcLines size.
	srcLines size timesRepeat:[ps add: nil].
	self incorporateMatchesInto: ps.
	self incorporateRemovalsInto: ps.
	self incorporateAddsInto: ps.
	^ps