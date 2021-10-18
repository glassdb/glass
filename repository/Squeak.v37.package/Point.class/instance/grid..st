point functions
grid: aPoint 
	"Answer a Point to the nearest rounded grid modules specified by aPoint."

	| newX newY |
	newX _ x + (aPoint x // 2) truncateTo: aPoint x.
	newY _ y + (aPoint y // 2) truncateTo: aPoint y.
	^newX @ newY