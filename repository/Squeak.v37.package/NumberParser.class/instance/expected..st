error
expected: aString 
	| errorString |
	errorString := aString , ' expected'.
	requestor isNil
		ifFalse: [requestor
				notify: errorString ].
	failBlock ifNotNil: [^failBlock cull: {errorString. sourceStream position + 1}].
	self error: 'Reading a number failed: ' , errorString