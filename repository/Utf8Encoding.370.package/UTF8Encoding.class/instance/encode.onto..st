API
encode: aString onto: aStringStream

	| source |
	source := aString readStream.
	[ source atEnd ] whileFalse: [
		self nextPut: source next on: aStringStream ]
