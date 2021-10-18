squeak protocol
starting: aDateAndTime duration: aDuration
	"Override - the duration is always one week.
	 Week will start from the Week class>>startDay"

	| midnight delta adjusted |
	midnight _ aDateAndTime asDateAndTime midnight.
	delta _ ((midnight dayOfWeek + 7 - (DayNames indexOf: self startDay)) rem: 7) abs.
	adjusted _ midnight - (Duration days: delta hours: 0 minutes: 0 seconds: 0).

	^ super starting: adjusted duration: (Duration weeks: 1).