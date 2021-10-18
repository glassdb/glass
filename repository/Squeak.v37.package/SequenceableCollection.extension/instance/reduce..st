*squeak
reduce: aBlock
	| argumentCount result |
	argumentCount := aBlock argumentCount.
	(argumentCount = 0 or: [ (self size + 1) \\ (argumentCount - 1) > 0 ])
		ifTrue: [ self error: 'Collection size and block argument count do not match.' ].
	result := self first.
	2 to: self size do: [ :index |
		result := aBlock
			value: result
			value: (self at: index) ].
	^ result