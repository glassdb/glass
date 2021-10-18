*squeak
fromDays: dayCount 
	"Days since 1 January 1901"

	^ self julianDayNumber: dayCount + 2415386 "julian calendar base"