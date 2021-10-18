testing
testEndsWithDigit


	self deny: 'abcd' endsWithDigit.
	self deny: 'abc1d' endsWithDigit.
	self deny: '123d' endsWithDigit.
	self assert: 'a234' endsWithDigit.
	self assert: '1234567890' endsWithDigit.
	self deny: '1234567890A' endsWithDigit.