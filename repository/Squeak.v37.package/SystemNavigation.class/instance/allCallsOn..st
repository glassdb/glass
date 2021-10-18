query
allCallsOn: aLiteral 
	"Answer a Collection of all the methods that call on aLiteral"

	| aCollection |
	aCollection _ OrderedCollection new.
	(self sendersOf: aLiteral) do: [:meth | 
		aCollection add: (MethodReference new setStandardClass: meth inClass methodSymbol: meth selector)].
	^ aCollection