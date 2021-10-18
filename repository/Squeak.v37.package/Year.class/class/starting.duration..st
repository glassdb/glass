squeak protocol
starting: aDateAndTime duration: aDuration 
	"Override - start from midnight"
	| midnight |
	midnight _ aDateAndTime asDateAndTime midnight.

	^ super
		starting: midnight
		duration: (Duration days: (self daysInYear: midnight year)).