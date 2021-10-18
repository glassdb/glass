testing
testDate_converting

	| date |
	date := Date newDay: 153 year: 1973.	"2 June 1973"
	self 
		assert: date asDate = date;
		assert: '2 June 1973' asDate = date.

	date dayMonthYearDo: [ :d :m :y | self assert: d = 2; assert: m = 6; assert: y = 1973 ].