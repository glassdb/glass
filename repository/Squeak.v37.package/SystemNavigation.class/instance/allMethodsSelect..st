query
allMethodsSelect: aBlock 
	"Answer a SortedCollection of each method that, when used as the block  
	argument to aBlock, gives a true result."

	| aCollection |
	aCollection _ SortedCollection new.
	self allBehaviorsDo: [:beh | 
		beh selectors do: [:sel | 
			(aBlock value: (beh compiledMethodAt: sel))
				ifTrue: [aCollection add: (MethodReference new setStandardClass: beh methodSymbol: sel)]]].
	^ aCollection