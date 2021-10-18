get
httpPostDocument: url  args: argsDict accept: mimeType request: requestString
	"like httpGET, except it does a POST instead of a GET.  POST allows data to be uploaded"

	| s header length page list firstData aStream type newUrl httpUrl argString |
	httpUrl := Url absoluteFromText: url.
	page := httpUrl fullPath.
	"add arguments"
	argString := argsDict
		ifNotNil: [
			argString := self argString: argsDict.
			argString first = $? ifTrue: [ argString := argString copyFrom: 2 to: argString size]]
		ifNil: [''].

	s := HTTPSocket new. 
	s := self initHTTPSocket: httpUrl timeoutSecs: 30 ifError: [:errorString | ^errorString].
	s sendCommand: 'POST ', page, ' HTTP/1.0', String crlf, 
		(mimeType ifNotNil: ['ACCEPT: ', mimeType, String crlf] ifNil: ['']),
		'ACCEPT: text/html', String crlf,	"Always accept plain text"
		HTTPProxyCredentials,
		HTTPBlabEmail,	"may be empty"
		requestString,	"extra user request. Authorization"
		self userAgentString, String crlf,
		'Content-type: application/x-www-form-urlencoded', String crlf,
		'Content-length: ', argString size printString, String crlf,
		'Host: ', httpUrl authority, String crlf.  "blank line automatically added"

	"umur - IE sends argString without a $? and swiki expects so"
	s sendCommand: argString.

	"get the header of the reply"
	list := s getResponseUpTo: String crlf, String crlf ignoring: String cr. "list = header, CrLf, CrLf, beginningOfData"
	header := list at: 1.
	"Transcript show: page; cr; show: argsStream contents; cr; show: header; cr."
	firstData := list at: 3.

	"dig out some headers"
	s header: header.
	length := s getHeader: 'content-length'.
	length ifNotNil: [ length := length asNumber ].
	type := s getHeader: 'content-type'.
	s responseCode first = $3 ifTrue: [
		newUrl := s getHeader: 'location'.
		newUrl ifNotNil: [
			"umur 6/25/2003 12:58 - If newUrl is relative then we need to make it absolute."
			newUrl := (httpUrl newFromRelativeText: newUrl) asString.
			self flag: #refactor. "get, post, postmultipart are almost doing the same stuff"
			s destroy.
			"^self httpPostDocument: newUrl  args: argsDict  accept: mimeType"
			^self httpGetDocument: newUrl accept: mimeType ] ].

	aStream := s getRestOfBuffer: firstData totalLength: length.
	s responseCode = '401' ifTrue: [^ header, aStream contents].
	s closeAndDestroy.	"Always OK to destroy!"

	^ MIMEDocument contentType: type  content: aStream contents url: url