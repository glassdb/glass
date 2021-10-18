proxy settings
proxyUser: userName password: password
	"Store  HTTP 1.0 basic authentication credentials
	Note: this is an ugly hack that stores your password
	in your image.  It's just enought to get you going
	if you use a firewall that requires authentication"

    | stream encodedStream |
	HTTPProxyUser := userName.
	HTTPProxyPassword := password.
	stream := ReadWriteStream on: (String new).
	stream nextPutAll: userName ,':' , password.
	encodedStream := Base64MimeConverter mimeEncode: stream.
	HTTPProxyCredentials := 'Proxy-Authorization: Basic ' , (encodedStream contents) , String crlf