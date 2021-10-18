squeak protocol
startDay: aSymbol

	(DayNames includes: aSymbol)
		ifTrue: [ StartDay _ aSymbol ]
		ifFalse: [ self error: aSymbol, ' is not a recognised day name' ]