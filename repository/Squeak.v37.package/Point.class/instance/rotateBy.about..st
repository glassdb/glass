transforming
rotateBy: angle about: center
	"Even though Point.theta is measured CW, this rotates with the more conventional CCW interpretateion of angle."

	| p r theta |
	p _ self - center.
	r _ p r.
	theta _ angle asFloat - p theta.
	^ (center x asFloat + (r * theta cos)) @
	  (center y asFloat - (r * theta sin))