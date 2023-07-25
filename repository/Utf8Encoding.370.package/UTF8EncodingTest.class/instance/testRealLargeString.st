testing
testRealLargeString
	
	| sample m1 m2 m3 m4 m5 |
	m1 := System millisecondsToRun: [ sample := self generateRandomString: 200000 ].
	m2 := System millisecondsToRun: [ self primEncodePrimDecode: sample ].
	m3 := System millisecondsToRun: [ self primEncodePrimDecode: sample ].
	m4 := System millisecondsToRun: [ self primEncodePrimDecodeDBS: sample ].
	m5 := System millisecondsToRun: [ self encodeDecode: sample ].
    	Transcript cr; show: 'testRealLargeString:'.
	Transcript cr; show: '  Generate (', sample size printString, '): ', m1 printString, 
		' primEncode/primDecode: ', m2 printString, 
		' primEncode/primDecode: ', m3 printString, 
		' primEncode/primDecodeDBS: ', m4 printString, 
		' encode/decode: ', m5 printString.
