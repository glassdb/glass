*squeak
peekLast
	^self isEmpty 
		ifTrue: [nil] 
		ifFalse: [self last]