testing
testIfNotEmpty

	#()
		ifNotEmpty: [ self assert: false ].
	{1. 2. 3}
		ifNotEmpty: [ self assert: true ].