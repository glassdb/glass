FMP
deltaToEnsureInOrCentered: r extra: aNumber

	| dX dY halfXDiff halfYDiff |
	dX _ dY _ 0.
	halfXDiff _ (r width - self width * aNumber) truncated.
	halfYDiff _ (r height - self height  * aNumber) truncated.
	self left < r left
		ifTrue: [dX _ self left - r left - halfXDiff]
		ifFalse: [self right > r right ifTrue: [dX _ self right - r right + halfXDiff]].
	self top < r top
		ifTrue: [dY _ self top - r top - halfYDiff]
		ifFalse: [self bottom > r bottom ifTrue: [dY _ self bottom - r bottom + halfYDiff]].
	^dX @ dY