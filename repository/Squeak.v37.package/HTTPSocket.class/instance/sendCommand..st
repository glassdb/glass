http
sendCommand: commandString
	"Send the given command as a single line followed by a <CR><LF> terminator."

	self write: (commandString, CrLf) asByteArray.