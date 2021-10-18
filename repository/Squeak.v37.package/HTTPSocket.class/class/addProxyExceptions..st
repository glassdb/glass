proxy settings
addProxyExceptions: aColl
	HTTPProxyExceptions isNil
		ifTrue: [HTTPProxyExceptions := Set new].
	HTTPProxyExceptions addAll: aColl.