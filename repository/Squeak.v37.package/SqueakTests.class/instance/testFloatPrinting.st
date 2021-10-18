testing
testFloatPrinting

	self assert: (111.2 asSqueakPrintString) = '111.2'.
	self assert: (111 asSqueakPrintString) = '111'.
	self assert: (0.98 asSqueakPrintString) = '0.98'.
	self assert: (-0.98 asSqueakPrintString) = '-0.98'.
	self assert: (2.567 asSqueakPrintString) = '2.567'.
	self assert: (-2.567 asSqueakPrintString) = '-2.567'.
	self assert: (0.01 asSqueakPrintString) = '0.01'.
	self assert: (-0.001 asSqueakPrintString) = '-0.001'.
	self assert: (1.009 asSqueakPrintString) = '1.009'.
	self assert: (35.900 asSqueakPrintString) = '35.9'.
	self assert: (-0.097 asSqueakPrintString) = '-0.097'.