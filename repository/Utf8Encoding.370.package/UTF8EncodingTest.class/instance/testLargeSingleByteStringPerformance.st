testing
testLargeSingleByteStringPerformance
	
	| sample m1 m2 m3 m4 m5 m6 encoded decoded |
	m1 := System millisecondsToRun: [ sample := self generateRandomSingleByteString: 200000 ].
	m2 := System millisecondsToRun: [
        self assert: sample class = String.
        encoded := sample encodeAsUTF8.
        self assert: encoded class = Utf8.
        decoded := encoded decodeFromUTF8 .
        self assert: decoded class = Unicode16.
        self assert: decoded = sample].
	m3 := System millisecondsToRun: [ 
        100 timesRepeat:[ sample encodeAsUTF8 ]].
	m4 := System millisecondsToRun: [ 
        100 timesRepeat:[ encoded decodeFromUTF8 ]].
	m6 := System millisecondsToRun: [ 
        100 timesRepeat:[ decoded = sample ]].
    	Transcript cr; show: 'testLargeSingleByteStringPerformance:'.
	Transcript cr; show: '  Generate (', sample size printString, '): ', m1 printString, 
		' primEncode/primDecode: ', m2 printString, 
		' 100_primEncode: ', m3 printString, 
		' 100_primDecode: ', m4 printString,
        ' 100_=: ', m6 printString.
