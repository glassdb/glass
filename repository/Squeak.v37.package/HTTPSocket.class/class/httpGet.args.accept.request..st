get
httpGet: url args: args accept: mimeType request: requestString
	"Return the exact contents of a web object. Asks for the given MIME type. If mimeType is nil, use 'text/html'."
	"Note: To fetch raw data, you can use the MIME type 'application/octet-stream'."

	| document |
	document _ self httpGetDocument: url  args: args  accept: mimeType request: requestString.
	(document isString) ifTrue: [
		"strings indicate errors"
		^ document ].

	^ (RWBinaryOrTextStream on: document content) reset