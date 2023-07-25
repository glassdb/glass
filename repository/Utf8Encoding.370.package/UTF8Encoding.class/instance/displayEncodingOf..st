API
displayEncodingOf: aCodePoint
	"self new displayEncodingOf: 16r2013"

	| stream |
    stream := WriteStream on: String new.
	(self encodingOf: aCodePoint) 
		do: [:char |  char codePoint printOn: stream base: 2 showRadix: true ]
		separatedBy: [ stream space ].
    ^stream contents
