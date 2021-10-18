*squeak
nextInt: anInteger
	"Answer a random integer in the interval [1, anInteger]."

	anInteger strictlyPositive ifFalse: [ self error: 'Range must be positive' ].
	^ (self next * anInteger) truncated + 1