testing
testDateArithmetic
	self assert: (Date today + 1 day) = Date tomorrow.
	self assert: (Date today - 1 day) = Date yesterday.
	self assert: (Date today + 12 hours) = Date today.
	self assert: (Date today - 12 hours) = Date yesterday.
	self assert: (Date tomorrow - Date today) days = 1.
	self assert: Time now asDateAndTime  <= DateAndTime now