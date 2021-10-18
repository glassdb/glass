*squeak
groupBy: keyBlock having: selectBlock 
	"Like in SQL operation - Split the recievers contents into collections of 
	elements for which keyBlock returns the same results, and return those 
	collections allowed by selectBlock. keyBlock should return an Integer."
	| result key |
	result _ KeyValueDictionary new.
	1 to: self size do: 
		[:i | | element |
		element := self at: i.
		key _ keyBlock value: element.
		(result includesKey: key)
			ifFalse: [result at: key put: OrderedCollection new].
		(result at: key)
			add: element].
	^ result _ result select: selectBlock