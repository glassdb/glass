testing
testDate_fromDays
	| epoch d0 d1 d2 date aDate |
	date := Date newDay: 153 year: 1973.	"2 June 1973"
	aDate := Date readFrom: '01-23-2004' readStream.

	epoch := Date newDay: 1 year: 1901.
	d0 := Date fromDays: 0. 			"1 January 1901"
	self assert: d0 = epoch.

	d1 := Date fromDays:  26450. 	"2 June 1973"
	self assert: d1 = date.

	d2 := Date fromDays: -100000.	"18 March 1627"
	self assert: d2 julianDayNumber = 2315386.

	self assert: aDate  =  (Date fromDays:  37642).
	self assert: aDate  =  (Date fromDays: 103*365 + 22 + 25 "leap days") .