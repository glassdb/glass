testing
testIssue229
	"ScaledDecimal was returing a float before bugfix."
		
	| obj1 obj2  |
	obj1 := ScaledDecimal fromString: '34.23'.
	obj2 := ScaledDecimal readFrom: obj1 printString readStream.
	self assert: obj1 class == obj2 class.
	self assert: obj1 = obj2.