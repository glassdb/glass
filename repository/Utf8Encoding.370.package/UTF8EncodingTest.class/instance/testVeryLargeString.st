testing
testVeryLargeString
	
	| sample m1 m2 m3 |
	m1 := System millisecondsToRun: [ sample := self generateRandomString: 200000 ].
	m2 := System millisecondsToRun: [ self primEncodePrimDecode: sample ].
	m3 := System millisecondsToRun: [ self primEncodePrimDecodeDBS: sample ].
    	Transcript cr; show: 'testVeryLargeString:'.
	Transcript cr; show: '  Generate (', sample size printString, '): ', m1 printString, 
		' primEncode/primDecode: ', m2 printString,
        ' primEncode/primDecodeDBS: ', m3 printString.
