instance creation
squeezeNumberOutOfString: stringOrStream onError: errorBlock
	"Try and find a number in this string. First, look if the string 
	starts with a number. Then, see if it ends with a number. Then,
	remove a character from the front and see if the remaining 
	string makes a number. Repeat the process until no characters
	are left or the number has been found. As soon as a number is
	found, it is returned. Otherwise, the method fails."
	| block string try |
	try := self parse: stringOrStream onError: [nil].
	try ifNotNil: [^try].
	try := self parse: stringOrStream asString copy reversed onError: [nil].
	try ifNotNil: [ ^ try asString reversed asNumber].
	string := stringOrStream.
	block := [^ stringOrStream
				ifEmpty: [^errorBlock value]
				ifNotEmpty: [string := string allButFirst.
					self parse: string onError: block]].
	block value