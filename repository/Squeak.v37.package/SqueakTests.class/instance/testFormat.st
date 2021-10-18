testing
testFormat

	self assert: ('foo {1} bar' format: {Date today}) = ('foo ', Date today asString, ' bar').
	self assert: ('\{ \} \\ foo {1} bar {2}' format: {12. 'string'}) = '{ } \ foo 12 bar string'