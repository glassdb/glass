*squeak-enumerating
associationsDo: aBlock
	"Evaluate aBlock for each of the receiver's elements (key/value 
	associations).  If any non-association is within, the error is not caught now,
	but later, when a key or value message is sent to it."

	1 to: self size do: [:i |  aBlock value: (self at: i) ]