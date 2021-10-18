instance creation
merging: listOfRects 
	"A number of callers of merge: should use this method."
	| minX minY maxX maxY |
	listOfRects
		do: [:r | minX
				ifNil: [minX _ r topLeft x. minY _ r topLeft y.
					maxX _ r bottomRight x. maxY _ r bottomRight y]
				ifNotNil: [minX _ minX min: r topLeft x. minY _ minY min: r topLeft y.
					maxX _ maxX max: r bottomRight x. maxY _ maxY max: r bottomRight y]].
	^ minX@minY corner: maxX@maxY