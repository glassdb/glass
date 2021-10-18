rectangle functions
areasOutside: aRectangle
	"Answer an Array of Rectangles comprising the parts of the receiver not 
	intersecting aRectangle."

	| areas yOrigin yCorner |
	"Make sure the intersection is non-empty"
	(origin <= aRectangle corner and: [aRectangle origin <= corner])
		ifFalse: [^Array with: self].
	areas _ OrderedCollection new.
	aRectangle origin y > origin y
		ifTrue: [areas addLast: (origin corner: corner x @ (yOrigin _ aRectangle origin y))]
		ifFalse: [yOrigin _ origin y].
	aRectangle corner y < corner y
		ifTrue: [areas addLast: (origin x @ (yCorner _ aRectangle corner y) corner: corner)]
		ifFalse: [yCorner _ corner y].
	aRectangle origin x > origin x 
		ifTrue: [areas addLast: (origin x @ yOrigin corner: aRectangle origin x @ yCorner)].
	aRectangle corner x < corner x 
		ifTrue: [areas addLast: (aRectangle corner x @ yOrigin corner: corner x @ yCorner)].
	^areas