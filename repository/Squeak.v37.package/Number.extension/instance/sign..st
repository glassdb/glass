*squeak
sign: aNumber
	"Return a Number with the same sign as aNumber"

	^ aNumber positive ifTrue: [self abs] ifFalse: [self abs negated].