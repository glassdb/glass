http
getRestOfBuffer: beginning totalLength: length
	"Reel in a string of a fixed length.  Part of it has already been received.  Close the connection after all chars are received.  We do not strip out linefeed chars." 
	"if length is nil, read until connection close.  Response is of type text, not binary."

	| buf response bytesRead |
	length ifNil: [^ self getRestOfBuffer: beginning].
	response _ RWBinaryOrTextStream on: String new.
	response nextPutAll: beginning.
	buf _ String new: 2000.

	[(response position - 1 < length) & (self isActive | self readyForRead)] 
	whileTrue: [
		[(self waitForReadDataUpToMs: (5000))] whileFalse: [
	 		GsFile gciLogServer: 'data is slow'].
		bytesRead _ self readInto: buf startingAt: 1 for: buf size.
		bytesRead > 0 ifTrue: [  
			response nextPutAll: (buf copyFrom: 1 to: bytesRead)] ].
	response position < length ifTrue: [^ 'server aborted early'].
	response reset.	"position: 0."
	^ response