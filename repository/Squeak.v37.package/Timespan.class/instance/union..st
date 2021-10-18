squeak protocol
union: aTimespan

	 "Return the Timespan spanned by both"

	| aBegin anEnd |

	aBegin _ self start min: aTimespan start.
	anEnd _ self end max: aTimespan end.
	^ Timespan starting: aBegin ending: (anEnd + DateAndTime clockPrecision).