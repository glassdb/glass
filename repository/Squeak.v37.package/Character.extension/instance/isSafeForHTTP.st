*squeak
isSafeForHTTP
	"whether a character is 'safe', or needs to be escaped when used, eg, in a URL"

	^ self charCode < 128
		and: [ self isAlphaNumeric
				or: [ '.-_' includes: self ]]