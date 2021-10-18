testing
testDateAndTimeAsTimeGMT

	| aDateAndTime |
	aDateAndTime :=  DateAndTime epoch.
	self assert: aDateAndTime asTime =  Time midnight.