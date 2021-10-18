creating patches
processShiftedRuns
	| key |
	shifted isNil ifTrue:[^self].
	shifted do:[:assoc|
		key := assoc key.
		assoc value doWithIndex:[:line :idx|
			removed add: (key y + idx - 1) -> line.
			added add: (key x + idx - 1) -> line].
		runs removeKey: assoc key.
	].