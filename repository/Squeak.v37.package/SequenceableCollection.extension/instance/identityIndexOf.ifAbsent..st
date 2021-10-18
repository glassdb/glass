*squeak
identityIndexOf: anElement ifAbsent: exceptionBlock
	"Answer the index of anElement within the receiver. If the receiver does 
	not contain anElement, answer the result of evaluating the argument, 
	exceptionBlock."

	| idx |
	idx := self indexOfIdentical: anElement.
	idx == 0 ifTrue: [ ^exceptionBlock value ].
	^idx