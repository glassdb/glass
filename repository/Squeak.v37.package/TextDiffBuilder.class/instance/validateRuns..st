creating patches
validateRuns: runList
	| srcPosCopy dstPosCopy lines srcIndex dstIndex |
	srcPosCopy := srcPos copy.
	srcPosCopy associationsDo:[:assoc| assoc value: assoc value asSet].
	dstPosCopy := dstPos copy.
	dstPosCopy associationsDo:[:assoc| assoc value: assoc value asSet].
	runList associationsDo:[:assoc|
		srcIndex := assoc key y.
		dstIndex := assoc key x.
		lines := assoc value.
		lines do:[:string|
			(srcPosCopy at: string) remove: srcIndex.
			(dstPosCopy at: string) remove: dstIndex.
			srcIndex := srcIndex + 1.
			dstIndex := dstIndex + 1.
		].
	].
	removed := OrderedCollection new.
	srcPosCopy associationsDo:[:assoc|
		assoc value do:[:index| removed add: (index -> assoc key)].
	].
	removed := removed sortBy:[:a1 :a2| a1 key < a2 key].
	added := OrderedCollection new.
	dstPosCopy associationsDo:[:assoc|
		assoc value do:[:index| added add: (index -> assoc key)].
	].
	added := added sortBy:[:a1 :a2| a1 key < a2 key].