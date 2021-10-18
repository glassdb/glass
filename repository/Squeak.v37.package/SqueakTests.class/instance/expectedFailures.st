testing
expectedFailures
	
	
	^((System stoneVersionAt: 'gsVersion') beginsWith: '3.0') 
		ifTrue: [ 
			#(
				testDateAndTimePrinting31 "bugfix for http://code.google.com/p/glassdb/issues/detail?id=344 not present in 3.0"
				testIssue348 "bugfix for http://code.google.com/p/glassdb/issues/detail?id=248 not present in 3.0"
			) ] 
		ifFalse: [ #() ]