proxy settings
useProxyServerNamed: proxyServerName port: portNum 
	"Direct all HTTP requests to the HTTP proxy server with the given name and port number."

	self httpProxyServer: proxyServerName.
	self httpProxyPort: portNum