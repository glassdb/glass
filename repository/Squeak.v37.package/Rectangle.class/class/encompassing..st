instance creation
encompassing: listOfPoints
	"A number of callers of encompass: should use this method."
	| topLeft bottomRight |
	topLeft _ bottomRight _ nil.
	listOfPoints do:
		[:p | topLeft == nil
			ifTrue: [topLeft _ bottomRight _ p]
			ifFalse: [topLeft _ topLeft min: p.
					bottomRight _ bottomRight max: p]].
	^ topLeft corner: bottomRight