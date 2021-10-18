proxy settings
shouldUseProxy: serverName
	"Retrieve the server and port information from the URL, match it to the proxy settings and open a http socket for the request."

	self httpProxyServer ifNotNil: [
		self httpProxyExceptions
			detect: [:domainName | domainName gemstoneMatch: serverName]
			ifNone: [^true]].
	^false