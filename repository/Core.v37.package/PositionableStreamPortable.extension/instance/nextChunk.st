*core-squeak
nextChunk
	"Answer the contents of the receiver, up to the next terminator character. Doubled terminators indicate an embedded terminator character."

	| terminator out ch |
	terminator := $!.
	out := AppendStream on: String new.
	self skipSeparators.
	[ self atEnd ]
		whileFalse: [ 
			ch := self next.
			ch == terminator
				ifTrue: [ 
					self peek == terminator
						ifTrue: [ self next	"skip doubled terminator" ]
						ifFalse: [ ^ out contents ] ].
			out nextPut: ch ].
	^ out contents
