rectangle functions
allAreasOutsideList: aCollection startingAt: startIndex do: aBlock
	"Enumerate aBlock with all areas of the receiver not overlapping 
	any rectangle in the given collection"
	| yOrigin yCorner aRectangle index rr |
	index _ startIndex.

	"Find the next intersecting rectangle from aCollection"
	[index <= aCollection size ifFalse:[^aBlock value: self].
	aRectangle _ aCollection at: index.
	origin <= aRectangle corner and: [aRectangle origin <= corner]] 
		whileFalse:[index _ index + 1].

	"aRectangle is intersecting; process it"
	aRectangle origin y > origin y 
		ifTrue: [rr _ origin corner: corner x @ (yOrigin _ aRectangle origin y).
				rr allAreasOutsideList: aCollection startingAt: index+1 do: aBlock]
		ifFalse: [yOrigin _ origin y].
	aRectangle corner y < corner y
		ifTrue: [rr _ origin x @ (yCorner _ aRectangle corner y) corner: corner.
				rr allAreasOutsideList: aCollection startingAt: index+1 do: aBlock]
		ifFalse: [yCorner _ corner y].
	aRectangle origin x > origin x 
		ifTrue: [rr _ origin x @ yOrigin corner: aRectangle origin x @ yCorner.
				rr allAreasOutsideList: aCollection startingAt: index+1 do: aBlock].
	aRectangle corner x < corner x 
		ifTrue: [rr _ aRectangle corner x @ yOrigin corner: corner x @ yCorner.
				rr allAreasOutsideList: aCollection startingAt: index+1 do: aBlock].