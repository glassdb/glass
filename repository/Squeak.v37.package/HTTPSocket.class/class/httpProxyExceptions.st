proxy settings
httpProxyExceptions
	^HTTPProxyExceptions isNil
		ifTrue: [#()]
		ifFalse: [HTTPProxyExceptions]