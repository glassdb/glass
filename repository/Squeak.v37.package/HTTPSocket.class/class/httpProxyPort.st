proxy settings
httpProxyPort
	^HTTPProxyPort isNil
		ifTrue: [self defaultPort]
		ifFalse: [HTTPProxyPort]