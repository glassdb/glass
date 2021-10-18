*squeak-printing
asSqueakPrintString

	| strm |
	strm := WriteStream on: String new.
	self printOn: strm base: 10.
	^strm contents