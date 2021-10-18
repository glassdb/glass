testing
testTimeReadFrom

	self assert: (Time readFrom: (ReadStream on: '2:23:09 pm')) printString  = '14:23:09'.
	self assert: (Time readFrom: (ReadStream on: '2:23:09 am')) printString  = '02:23:09'.
	self assert: '2:23:09 pm' asTime printString  = '14:23:09'.
	self assert: '2:23:09 pm' asDoubleByteString asTime printString  = '14:23:09'.