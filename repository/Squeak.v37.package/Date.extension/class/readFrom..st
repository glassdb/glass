*squeak
readFrom: aStream 
	"Read a Date from the stream in any of the forms:  
	
		<day> <monthName> <year>		(5 April 1982; 5-APR-82)  
	
		<monthName> <day> <year>		(April 5, 1982)  
	
		<monthNumber> <day> <year>		(4/5/82) 
			<day><monthName><year>			(5APR82)"
	| day month year |
	aStream peek isDigit
		ifTrue: [day := Integer readFrom: aStream].
	[aStream peek isAlphaNumeric]
		whileFalse: [aStream skip: 1].
	aStream peek isLetter
		ifTrue: ["number/name... or name..."
			month := WriteStream
						on: (String new: 10).
			[aStream peek isLetter]
				whileTrue: [month nextPut: aStream next].
			month := month contents.
			day isNil
				ifTrue: ["name/number..."
					[aStream peek isAlphaNumeric]
						whileFalse: [aStream skip: 1].
					day := Integer readFrom: aStream]]
		ifFalse: ["number/number..."
			month := Month nameOfMonth: day.
			day := Integer readFrom: aStream].
	month := self _getMonthFrom: month.
	[aStream peek isAlphaNumeric]
		whileFalse: [aStream skip: 1].
	year := Integer readFrom: aStream.
	year < 10 ifTrue: [year := 2000 + year] 
		ifFalse: [ year < 1900 ifTrue: [ year := 1900 + year]].

	^ self
		year: year
		month: month
		day: day