*squeak
readFrom: textStringOrStream
	"Create an object based on the contents of textStringOrStream."

	| string object |
	textStringOrStream isString
		ifTrue: [ string := textStringOrStream ]
		ifFalse: [ string := textStringOrStream contents asString].
	object := string evaluate.
	(object isKindOf: self) ifFalse: [self error: self name, ' expected'].
	^object