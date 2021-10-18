testing
testDigitValue

	self assert: (Character digitValue: 9) = $9.
	self assert: (Character digitValue: 0) = $0.
	self assert: (Character digitValue: 10) = $A.
	self assert: (Character digitValue: 35) = $Z.