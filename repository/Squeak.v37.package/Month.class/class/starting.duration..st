squeak protocol
starting: aDateAndTime duration: aDuration 
	"Override - a each month has a defined duration"
	| start adjusted days |
	start _ aDateAndTime asDateAndTime.
	adjusted _ DateAndTime
				year: start year
				month: start month
				day: 1.
	days _ self daysInMonth: adjusted month forYear: adjusted year.
	^ super
		starting: adjusted
		duration: (Duration days: days)