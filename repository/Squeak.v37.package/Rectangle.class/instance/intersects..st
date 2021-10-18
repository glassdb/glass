testing
intersects: aRectangle 
	"Answer whether aRectangle intersects the receiver anywhere."
	"Optimized; old code answered:
		(origin max: aRectangle origin) < (corner min: aRectangle corner)"

	| rOrigin rCorner |
	rOrigin _ aRectangle origin.
	rCorner _ aRectangle corner.
	rCorner x <= origin x	ifTrue: [^ false].
	rCorner y <= origin y	ifTrue: [^ false].
	rOrigin x >= corner x	ifTrue: [^ false].
	rOrigin y >= corner y	ifTrue: [^ false].
	^ true