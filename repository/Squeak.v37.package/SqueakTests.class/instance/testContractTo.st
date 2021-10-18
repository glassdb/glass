testing
testContractTo

	| str ans |
	str := 'abcdefghijklmnopqrstuvwxyz'.
	self assert: (str contractTo: 30) = str.
	self assert: (ans := str contractTo: 25) size == 25.
	self assert: (ans includesString: '...')