*squeak
ifEmpty: emptyBlock ifNotEmpty: notEmptyBlock
	^ self size == 0
		ifTrue: emptyBlock
		ifFalse: [notEmptyBlock valueWithPossibleArgument: self]