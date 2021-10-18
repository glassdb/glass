*squeak
to: anEnd
	"Answer a Timespan. anEnd conforms to protocol DateAndTime or protocol Timespan"

	^ Timespan starting: self asDateAndTime ending: (anEnd asDateAndTime).