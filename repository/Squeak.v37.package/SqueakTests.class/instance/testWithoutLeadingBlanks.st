testing
testWithoutLeadingBlanks

	self assert: ('   abcd' withoutLeadingBlanks) = 'abcd'