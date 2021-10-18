rectangle functions
quickMerge: aRectangle 
	"Answer the receiver if it encloses the given rectangle or the merge of the two rectangles if it doesn't. THis method is an optimization to reduce extra rectangle creations."

	| useRcvr rOrigin rCorner minX maxX minY maxY |
	useRcvr _ true.
	rOrigin _ aRectangle topLeft.
	rCorner _ aRectangle bottomRight.
	minX _ rOrigin x < origin x ifTrue: [useRcvr _ false. rOrigin x] ifFalse: [origin x].
	maxX _ rCorner x > corner x ifTrue: [useRcvr _ false. rCorner x] ifFalse: [corner x].
	minY _ rOrigin y < origin y ifTrue: [useRcvr _ false. rOrigin y] ifFalse: [origin y].
	maxY _ rCorner y > corner y ifTrue: [useRcvr _ false. rCorner y] ifFalse: [corner y].

	useRcvr
		ifTrue: [^ self]
		ifFalse: [^ Rectangle origin: minX@minY corner: maxX@maxY].