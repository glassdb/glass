testing
testDateAndTimePrinting
	self assert: (DateAndTime year: 2011 month: 10 day: 31 hour: 14 minute: 23 second: (ScaledDecimal fromString: '47.123') offset: Duration zero) printString = '2011-10-31T14:23:47.123+00:00'.
	self assert: (DateAndTime year: 2011 month: 10 day: 31 hour: 14 minute: 23 second: (ScaledDecimal fromString: '47.12') offset: Duration zero) printString = '2011-10-31T14:23:47.12+00:00'.
	self assert: (DateAndTime year: 2011 month: 10 day: 31 hour: 14 minute: 23 second: (ScaledDecimal fromString: '47.1') offset: Duration zero) printString = '2011-10-31T14:23:47.1+00:00'.
	self assert: (DateAndTime year: 2011 month: 10 day: 31 hour: 14 minute: 23 second: (ScaledDecimal fromString: '47.0') offset: Duration zero) printString = '2011-10-31T14:23:47+00:00'.
	self assert: (DateAndTime year: 2011 month: 10 day: 31 hour: 14 minute: 23 second: 47.0 offset: Duration zero) printString = '2011-10-31T14:23:47+00:00'