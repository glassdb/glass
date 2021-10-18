*squeak
asRFC1123StringOn: aStream

	| utc year month day |
	utc := self asUTC.
	utc dayMonthYearDo: [ :d :m :y | year := y. month := m. day := d ].
	aStream
		nextPutAll: (day asString padded: #left to: 2 with: $0);
		space;
		nextPutAll: utc monthAbbreviation;
		space;
		nextPutAll: (year abs asString padded: #left to: 4 with: $0).
	aStream space.
	aStream
		nextPutAll: (utc hour asString padded: #left to: 2 with: $0);
		nextPut: $:;
		nextPutAll: (utc minute asString padded: #left to: 2 with: $0);
		nextPut: $:;
		nextPutAll: (utc second asInteger asString padded: #left to: 2 with: $0).