utilities
initHTTPSocket: httpUrl wait: timeout ifError: aBlock
	"Retrieve the server and port information from the URL, match it to the proxy settings and open a http socket for the request."

	| serverName connectToHost connectToPort serverAddr s |
	serverName := connectToHost := httpUrl authority.
	connectToPort := httpUrl port ifNil: [self defaultPort].

	(self shouldUseProxy: connectToHost) ifTrue: [ 
		connectToHost := self httpProxyServer.
		connectToHost isNil ifTrue: [connectToHost := serverName.]. 
		connectToPort := self httpProxyPort].

  	"make the request"	
	serverAddr := GsSocket getHostAddressByName: connectToHost.
	serverAddr ifNil: [
		aBlock value: 'Error: Could not resolve the server named: ', connectToHost].

	[ s := HTTPSocket connectToServerOnHost: serverAddr port: connectToPort ] 
		on: Error 
		do: [:ex | 
			^ aBlock value: 'Error: Server ',httpUrl authority,' is not responding' ].
	^s