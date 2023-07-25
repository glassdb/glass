accessing
sizeOf: code

	16r7F >= code
		ifTrue: [ ^1 ]
		ifFalse: [ 
			code < 16r800 ifTrue: [ ^2 ].
			code < 16r10000 ifTrue: [ ^3].
			code < 16r110000 ifTrue: [ ^4 ].
			InvalidUtf8Error signal: 'Character codePoint too large to represent in UTF8: ', code printString ]
