testing
testDateAndTimeAsTime

	| aDateAndTime |
	aDateAndTime :=  self epochLocalOffset.
	self assert: aDateAndTime asTime =  Time midnight.