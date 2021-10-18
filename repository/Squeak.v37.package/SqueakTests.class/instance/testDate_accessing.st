testing
testDate_accessing

	| date |
	date := Date newDay: 153 year: 1973.	"2 June 1973"
	self	
		assert: date dayOfYear = 153;
		assert: date julianDayNumber = 2441836;
		deny: date leap;
		assert: date monthIndex = 6;
		assert: date monthName = 'June';
		assert: date weekday = 'Saturday';
		assert: date weekdayIndex = 7;
		assert: date year = 1973.