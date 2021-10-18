rectangle functions
intersect: aRectangle 
	"Answer a Rectangle that is the area in which the receiver overlaps with 
	aRectangle. Optimized for speed; old code read:
		^Rectangle 
			origin: (origin max: aRectangle origin)
			corner: (corner min: aRectangle corner)
	"
	| aPoint left right top bottom |
	aPoint _ aRectangle origin.
	aPoint x > origin x ifTrue:[left _ aPoint x] ifFalse:[left _ origin x].
	aPoint y > origin y ifTrue:[top _ aPoint y] ifFalse:[top _ origin y].
	aPoint _ aRectangle corner.
	aPoint x < corner x ifTrue:[right _ aPoint x] ifFalse:[right _ corner x].
	aPoint y < corner y ifTrue:[bottom _ aPoint y] ifFalse:[bottom _ corner y].
	^Rectangle
		origin: (left@top)
		corner: (right@bottom)