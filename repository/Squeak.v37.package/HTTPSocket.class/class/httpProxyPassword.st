proxy settings
httpProxyPassword
	^HTTPProxyPassword isNil
		ifTrue: ['']
		ifFalse: [HTTPProxyPassword]