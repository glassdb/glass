creating patches
detectShiftedRuns
	| sortedRuns lastY run shiftedRuns |
	runs size < 2 ifTrue: [^ nil].
	shiftedRuns := OrderedCollection new.
	sortedRuns := SortedCollection sortBlock: [:a1 :a2 | a1 key x < a2 key x].
	runs associationsDo: [:assoc | sortedRuns add: assoc].
	lastY := sortedRuns first key y.
	2 to: sortedRuns size do:[:i | 
		run := sortedRuns at: i.
		run key y > lastY
			ifTrue: [lastY := run key y]
			ifFalse: [shiftedRuns add: run]].
	^ shiftedRuns