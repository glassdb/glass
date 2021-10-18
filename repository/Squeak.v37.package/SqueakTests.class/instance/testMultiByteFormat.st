testing
testMultiByteFormat

	| mbString |
	mbString := String with: (Character value: 8364).
	self assert: (('foo {1} bar', mbString) format: {Date today}) = ('foo ', Date today asString, ' bar', mbString).
	self assert: (('\{ \} \\ foo {1} bar', mbString, ' {2}') format: {12. 'string'}) = ('{ } \ foo 12 bar', mbString, ' string')