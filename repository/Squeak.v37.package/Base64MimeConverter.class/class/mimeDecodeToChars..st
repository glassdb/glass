as yet unclassified
mimeDecodeToChars: aStream 
	"Return a ReadWriteStream of the original String.  aStream has only 65 innocuous character values.  It is not binary.  (See class comment). 4 bytes in aStream goes to 3 bytes in output."

	| me |
	aStream setToBeginning.
	me := self new mimeStream: aStream.
	me dataStream: (ReadWriteStream on: String new).
	me mimeDecode.
	me dataStream setToBeginning.
	^ me dataStream