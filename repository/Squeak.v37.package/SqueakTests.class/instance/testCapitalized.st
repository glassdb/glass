testing
testCapitalized


	self assert: 'abcd' capitalized = 'Abcd'.
	self assert: '' capitalized = ''.
	self assert: '1abcd' capitalized = '1abcd'.