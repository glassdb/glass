testing
testAsStringWithCommas

	self assert: 123456789 asStringWithCommas = '123,456,789'.
	self assert: -123456789 asStringWithCommas = '-123,456,789'