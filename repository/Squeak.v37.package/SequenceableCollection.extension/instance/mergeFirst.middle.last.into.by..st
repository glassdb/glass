*squeak-sorting
mergeFirst: first middle: middle last: last into: dst by: aBlock
	"Private. Merge the sorted ranges [first..middle] and [middle+1..last] 
	of the receiver into the range [first..last] of dst."

	| i1 i2 val1 val2 out |
	i1 _ first.
	i2 _ middle + 1.
	val1 _ self at: i1.
	val2 _ self at: i2.
	out _ first - 1.  "will be pre-incremented"

	"select 'lower' half of the elements based on comparator"
	[(i1 <= middle) and: [i2 <= last]] whileTrue:
		[(aBlock value: val1 value: val2)
			ifTrue: [dst at: (out _ out + 1) put: val1.
					val1 _ self at: (i1 _ i1 + 1)]
			ifFalse: [dst at: (out _ out + 1) put: val2.
					i2 _ i2 + 1.
					i2 <= last ifTrue: [val2 _ self at: i2]]].

	"copy the remaining elements"
	i1 <= middle
		ifTrue: [dst replaceFrom: out + 1 to: last with: self startingAt: i1]
		ifFalse: [dst replaceFrom: out + 1 to: last with: self startingAt: i2]