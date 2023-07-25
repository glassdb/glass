API
encode: aString
	"^<String>"

	| encoded |
    encoded := WriteStream on: String new.
	self encode: aString onto: encoded.
    ^encoded contents
