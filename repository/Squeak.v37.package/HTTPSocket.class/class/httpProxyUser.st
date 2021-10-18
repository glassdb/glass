proxy settings
httpProxyUser
	^HTTPProxyUser isNil
		ifTrue: ['']
		ifFalse: [HTTPProxyUser]