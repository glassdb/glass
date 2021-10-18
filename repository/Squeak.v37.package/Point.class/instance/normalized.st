point functions
normalized
	"Optimized for speed -- ar 8/26/2001"
	| r |
	r _ ((x*x) + (y * y)) sqrt.
	^(x / r) @ (y / r)