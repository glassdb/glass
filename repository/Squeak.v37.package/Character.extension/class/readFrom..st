*squeak
readFrom: textStringOrStream
	"Create an object based on the contents of textStringOrStream."

	| string |
	textStringOrStream isString
		ifTrue: [ string := textStringOrStream ]
		ifFalse: [ string := textStringOrStream contents asString].
	^string size = 2
		ifTrue: [ string evaluate ]
		ifFalse: [ | val |
			"Double or Quad byte character from Squeak"
			val := string size == 3
				ifTrue: [((string at: 2) asciiValue << 8) + ((string at: 3) asciiValue)]
				ifFalse: [
					string size = 4
						ifTrue: [((((string at: 2) asciiValue << 8) + ((string at: 3) asciiValue)) << 8) + (string at: 4) asciiValue]
						ifFalse: [((((((string at: 2) asciiValue << 8) + ((string at: 3) asciiValue)) << 8) + ((string at: 4) asciiValue)) << 8) + ((string at: 5) asciiValue)]].
			Character value: val]