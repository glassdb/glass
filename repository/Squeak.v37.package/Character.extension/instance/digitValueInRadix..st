*squeak
digitValueInRadix: radix

"Returns a SmallInteger representing the value of the receiver, a digit, or
 returns nil if the receiver is not a digit in the given radix."

	| value |
	(value := self digitValue) < 0 ifTrue: [^nil].
	^radix <= value
		ifTrue: [nil]
		ifFalse: [value].