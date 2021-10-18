*squeak
readFrom: inStream
	"Answer an instance of me that is determined by reading the stream, 
	inStream. Embedded double quotes become the quote Character."

	| outStream char done |
	outStream _ WriteStream on: self new.
	"go to first quote"
	inStream skipTo: $'.
	done _ false.
	[done or: [inStream atEnd]]
		whileFalse: 
			[char _ inStream next.
			char = $'
				ifTrue: 
					[inStream atEnd
						ifTrue: [ done := true ]
						ifFalse: [ outStream nextPut: inStream next ]]
				ifFalse: [outStream nextPut: char]].
	^outStream contents