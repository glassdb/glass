*squeak
julianDayNumber: aJulianDayNumber

	(DateAndTime julianDayNumber: aJulianDayNumber) dayMonthYearDo: [:day :month :year |
		^ self newDay: day monthNumber: month year: year ]