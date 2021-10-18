point functions
normal
	"Answer a Point representing the unit vector rotated 90 deg clockwise."

	| n |
	n _ y negated @ x.
	^n / (n x * n x + (n y * n y)) sqrt