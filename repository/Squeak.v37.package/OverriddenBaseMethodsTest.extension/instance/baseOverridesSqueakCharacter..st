*squeak
baseOverridesSqueakCharacter: known

	self 
		addTo: known 
		forBehavior: Character 
		overrides: {
			#digitValue ->'digitValue

"Returns a SmallInteger representing the value of the receiver,
 a digit, or returns nil if the receiver is not a digit."

(self isDigit)
  ifTrue: [ ^self asciiValue - $0 asciiValue]
  ifFalse: [ ^nil]
'.
			#digitValueInRadix: ->'digitValueInRadix: radix

"Returns a SmallInteger representing the value of the receiver, a digit, or
 returns nil if the receiver is not a digit in the given radix."

| val up |
radix == 10 ifTrue: [ ^self digitValue ].
radix < 10 ifTrue: [
  val := self digitValue.
  val >= radix ifTrue: [ ^nil ].
  ^val
].
val := self digitValue.
val ~~ nil ifTrue: [ ^val ].
up := self asUppercase.
($A <= up _and: [ up <= (self class withValue: ($A asciiValue + radix - 11)) ])
ifTrue: [
  ^(up asciiValue - $A asciiValue) + 10
]
ifFalse: [
  ^nil
]
'.
	}