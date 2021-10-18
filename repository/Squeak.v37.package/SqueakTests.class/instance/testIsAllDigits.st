testing
testIsAllDigits


	self deny: 'abcd' isAllDigits.
	self deny: '1abcd' isAllDigits.
	self deny: '123d' isAllDigits.
	self deny: 'a234' isAllDigits.
	self assert: '1234567890' isAllDigits.
	self deny: 'A1234567890' isAllDigits.