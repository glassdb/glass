*squeak
ifNotEmpty: aBlock
	^ self size == 0 ifFalse: [aBlock valueWithPossibleArgument: self]