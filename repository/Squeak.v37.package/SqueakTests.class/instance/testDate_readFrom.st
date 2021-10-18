testing
testDate_readFrom

	| date |
	date := Date newDay: 5 month: 'April' year: 1982.
	self assert: (Date readFrom: '5 April 1982' readStream) =  date.
	self assert: (Date readFrom: '5-APR-82' readStream) =  date.
	self assert: (Date readFrom: 'April 5, 1982' readStream) =  date.
	self assert: (Date readFrom: '5APR82' readStream) =  date.

	self assert: (Date fromString: '5 April 1982') =  date.
	self assert: (Date fromString: '5-APR-82') =  date.
	self assert: (Date fromString: 'April 5, 1982') =  date.
	self assert: (Date fromString: '5APR82') =  date.
	
	self assert: (Date fromString: '4/5/1982') =  date.
	self assert: (Date fromString: '4/5/82') =  date.