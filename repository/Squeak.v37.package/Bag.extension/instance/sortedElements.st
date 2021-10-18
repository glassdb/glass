*squeak-accessing
sortedElements
	"Answer with a collection of elements with counts, sorted by element."
	| elements |
	elements := SortedCollection sortBlock: [:x :y | x >= y].
	dict
		associationsDo: [:assn | elements add: assn].
	^ elements