proxy settings
proxyCredentials

	self httpProxyServer ifNotNil: [ ^nil ].
	^HTTPProxyCredentials