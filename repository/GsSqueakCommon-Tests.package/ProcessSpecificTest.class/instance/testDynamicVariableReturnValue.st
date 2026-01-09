testing
testDynamicVariableReturnValue

	| testBlock returnValue |

	testBlock := [ | number |
		number := 5.
		number * number ].

	returnValue := nil.
	returnValue := TestDynamicVariable value: 1 during: testBlock.

	self assert: testBlock value equals: returnValue