http
getRestOfBuffer: beginning 
	"We don't know the length. Keep going until connection is closed. Part of
	it has already been received. Response is of type text, not binary."
	| buf response bytesRead |
	response := RWBinaryOrTextStream
				on: String new.
	response nextPutAll: beginning.
	buf := String new: 2000.
	[self isActive "& self readyForRead" & self underlyingSocket isConnected]
		whileTrue: [
			[(self waitForReadDataUpToMs: (5000))] whileFalse: [
	 			GsFile gciLogServer: 'data is slow'].
			bytesRead _ self readInto: buf startingAt: 1 for: buf size.
			bytesRead > 0
				ifTrue: [ response nextPutAll: (buf copyFrom: 1 to: bytesRead) ]].
	response size = 0 ifTrue: [ ^'Empty Buffer' ].
	response reset.
	^ response