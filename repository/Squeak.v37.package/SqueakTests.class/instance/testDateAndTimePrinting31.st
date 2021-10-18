testing
testDateAndTimePrinting31
	self assert: (DateAndTime year: 2011 month: 10 day: 31 hour: 14 minute: 23 second: (ScaledDecimal fromString: '47') offset: Duration zero) printString = '2011-10-31T14:23:47+00:00'.