rectangle functions
amountToTranslateWithin: aRectangle
	"Answer a Point, delta, such that self + delta is forced within aRectangle."
	"Altered so as to prefer to keep self topLeft inside when all of self
	cannot be made to fit 7/27/96 di"
	| dx dy |
	dx _ 0.  dy _ 0.
	self right > aRectangle right ifTrue: [dx _ aRectangle right - self right].
	self bottom > aRectangle bottom ifTrue: [dy _ aRectangle bottom - self bottom].
	(self left + dx) < aRectangle left ifTrue: [dx _ aRectangle left - self left].
	(self top + dy) < aRectangle top ifTrue: [dy _ aRectangle top - self top].
	^ dx@dy