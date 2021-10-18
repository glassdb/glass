as yet unclassified
mimeDecodeToBytes: aStream 
	"Return a RWBinaryOrTextStream of the original ByteArray.  aStream has only 65 innocuous character values.  aStream is not binary.  (See class comment). 4 bytes in aStream goes to 3 bytes in output."

	| me |
	aStream setToBeginning.
	me _ self new mimeStream: aStream.
	me dataStream: (RWBinaryOrTextStream on: (String new)).
	me mimeDecodeToByteArray.
	me dataStream setToBeginning.
	me dataStream binary.
	^ me dataStream