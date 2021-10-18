testing
testIfEmptyIfNotEmpty

	#()
		ifEmpty: [ self assert: true ]
		ifNotEmpty: [ self assert: false].
	{1. 2. 3}
		ifEmpty: [ self assert: false ]
		ifNotEmpty: [ self assert: true].