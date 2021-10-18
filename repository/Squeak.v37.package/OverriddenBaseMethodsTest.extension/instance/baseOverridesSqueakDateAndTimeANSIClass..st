*squeak
baseOverridesSqueakDateAndTimeANSIClass: known
	self
		addTo: known
		forBehavior: DateAndTimeANSI class
		overrides: {
			"2.4.4"
			#'fromString:' -> 'fromString: aString
	"YYYY-MM-DDTHH:MM:SS+HH:MM"

	^self
		year:   (aString copyFrom:  1 to:  4) asNumber
		month:  (aString copyFrom:  6 to:  7) asNumber
		day:    (aString copyFrom:  9 to: 10) asNumber
		hour:   (aString copyFrom: 12 to: 13) asNumber
		minute: (aString copyFrom: 15 to: 16) asNumber
		second: (aString copyFrom: 18 to: 19) asNumber
		offset: (Duration
			days:    0 
			hours:   (aString copyFrom: 21 to: 22) asNumber * ((aString at: 20) == $+ ifTrue: [1] ifFalse: [-1])
			minutes: (aString copyFrom: 24 to: 25) asNumber
			seconds: 0)
'.
			"2.3.x"
			#'fromString:' -> 'fromString: aString
	"YYYY-MM-DDTHH:MM:SS+HH:MM"

	^self
		year:   (aString copyFrom:  1 to:  4) asNumber
		month:  (aString copyFrom:  6 to:  7) asNumber
		day:    (aString copyFrom:  9 to: 10) asNumber
		hour:   (aString copyFrom: 12 to: 13) asNumber
		minute: (aString copyFrom: 15 to: 16) asNumber
		second: (aString copyFrom: 18 to: 19) asNumber
		offset: (Duration
			days:    0 
			hours:   (aString copyFrom: 21 to: 22) asNumber * ((aString at: 20) = $+ ifTrue: [1] ifFalse: [-1])
			minutes: (aString copyFrom: 24 to: 25) asNumber
			seconds: 0)
'.
	}