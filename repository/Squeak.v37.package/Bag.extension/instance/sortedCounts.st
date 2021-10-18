*squeak-accessing
sortedCounts
	"Answer with a collection of counts with elements, sorted by decreasing
	count."

	| counts |
	counts := SortedCollection sortBlock: [:x :y | x >= y].
	dict associationsDo:
		[:assn |
		counts add: (Association key: assn value value: assn key)].
	^ counts