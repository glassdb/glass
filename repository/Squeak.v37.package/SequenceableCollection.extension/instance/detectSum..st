*squeak-enumerating
detectSum: aBlock
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Return the sum of the answers."
	| sum |
	sum _ 0.
	1 to: self size do: [:i | 
		sum _ (aBlock value: (self at: i)) + sum].  
	^ sum