enumerating
months


	| months |

	months _ OrderedCollection new: 12.
	self monthsDo: [ :m | months add: m ].

	^ months asArray.