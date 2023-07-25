private
nextByteFrom: aStream 

	| byte |
	byte := aStream next.
	byte isNil ifTrue: [ self badlyFormedUTF8Stream ].
	^byte asInteger
