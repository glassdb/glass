query
allImplementorsOf: aSelector 
	"Answer a SortedCollection of all the methods that implement the message 
	aSelector."

	| aCollection |
	aCollection _ SortedCollection new.
	(self classOrganizer implementorsOf: aSelector) do: [:meth |
		aCollection add: (MethodReference new setStandardClass: meth inClass methodSymbol: aSelector).
	].
	^aCollection