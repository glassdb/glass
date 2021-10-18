*squeak
count: aBlock 
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Answer the number of elements that answered true."

	| sum |
	sum _ 0.
	1 to: self size do: [:i | | element |
		element := self at: i.
		(aBlock value: element) ifTrue: [sum _ sum + 1]].
	^ sum