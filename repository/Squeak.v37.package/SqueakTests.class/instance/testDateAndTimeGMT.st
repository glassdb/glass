testing
testDateAndTimeGMT

	| aDateAndTime x |
	aDateAndTime :=  DateAndTime epoch.
	self assert: aDateAndTime =  (x := DateAndTime date: '01-01-1901' asDate time: '00:00:00' asTime offset: Duration zero)