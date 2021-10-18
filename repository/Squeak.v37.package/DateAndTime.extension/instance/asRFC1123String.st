*squeak
asRFC1123String
	"^a String
	c.f  >>asRFC1123StringOn: "

	| targetStream |
	targetStream := WriteStream on: String new.
	self asRFC1123StringOn: targetStream.
	^targetStream contents