as yet unclassified
decodeInteger: mimeString
	| bytes sum |
	"Decode the MIME string into an integer of any length"

	bytes _ (Base64MimeConverter mimeDecodeToBytes: 
				(ReadStream on: mimeString)) contents.
	sum _ 0.
	bytes reverseDo: [:by | sum _ sum * 256 + by].
	^ sum