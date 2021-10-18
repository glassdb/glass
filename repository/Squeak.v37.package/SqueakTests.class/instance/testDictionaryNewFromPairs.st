testing
testDictionaryNewFromPairs
	| dic |
	dic := Dictionary newFromPairs: {'Red' . Color red . 'Blue' . Color blue }.
	self assert: ((dic at: 'Red') = Color red).
	self assert: ((dic at: 'Blue') = Color blue).