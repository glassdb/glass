*squeak-enumerating
do: aBlock without: anItem
	"Enumerate all elements in the receiver.
	Execute aBlock for those elements that are not equal to the given item"

	1 to: self size do:
		[:index | anItem = (self at: index) ifFalse:[aBlock value: (self at: index)]]