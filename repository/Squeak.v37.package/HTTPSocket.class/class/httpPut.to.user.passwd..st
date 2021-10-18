put
httpPut: contents to: url user: user passwd: passwd
	"Upload the contents of the stream to a file on the server"

	| bare serverName specifiedServer port page serverAddr authorization s list header firstData length aStream command |
	"parse url"
	bare _ (url asLowercase beginsWith: 'http://') 
		ifTrue: [url copyFrom: 8 to: url size]
		ifFalse: [url].
	serverName _ bare copyUpTo: $/.
	specifiedServer _ serverName.
	(serverName includes: $:) ifFalse: [ port _ self defaultPort ] ifTrue: [
		port _ (serverName copyFrom: (serverName indexOf: $:) + 1 
				to: serverName size) asNumber.
		serverName _ serverName copyUpTo: $:.
	].

	page _ bare copyFrom: (bare indexOf: $/) to: bare size.
	page size = 0 ifTrue: [page _ '/'].
	(self shouldUseProxy: serverName) ifTrue: [ 
		page := 'http://', serverName, ':', port printString, page.		"put back together"
		serverName := self httpProxyServer.
		port := self httpProxyPort].

  	"make the request"	
	serverAddr := GsSocket getHostAddressByName: serverName.
	serverAddr ifNil: [
		^ 'Could not resolve the server named: ', serverName].

	authorization _ (self mimeConverterClass mimeEncode: (user , ':' , passwd) readStream) contents.
	s _ HTTPSocket  connectToServerOnHost: serverAddr port: port.
	command _ 
		'PUT ', page, ' HTTP/1.0', CrLf, 
		self userAgentString, CrLf,
		'Host: ', specifiedServer, CrLf, 
		'ACCEPT: */*', CrLf,
		'',
		'Authorization: Basic ' , authorization , CrLf , 
		'Content-length: ', contents size printString, CrLf , CrLf , 
		contents.
	s sendCommand: command.
	"get the header of the reply"
	list _ s getResponseUpTo: CrLf, CrLf ignoring: (String with: CR).	"list = header, CrLf, CrLf, beginningOfData"
	header _ list at: 1.
	firstData _ list at: 3.

	"dig out some headers"
	s header: header.
	length _ s getHeader: 'content-length'.
	length ifNotNil: [ length _ length asNumber ].

	aStream _ s getRestOfBuffer: firstData totalLength: length.
	s close.	"Always OK to destroy!"

	^ header, aStream contents