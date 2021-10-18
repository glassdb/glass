*squeak-enumerating
noneSatisfy: aBlock
	"Evaluate aBlock with the elements of the receiver.
	If aBlock returns false for all elements return true.
	Otherwise return false"

	1 to: self size do: [:i | (aBlock value: (self at: i)) ifTrue: [^ false]].
	^ true