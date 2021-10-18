query
allCallsOn: aLiteral from: aClass
	"Answer a SortedCollection of all the methods that call on aSymbol."


	| aCollection |
	aCollection _ SortedCollection new.
	(self sendersOf: aLiteral in: aClass withAllSubclasses) do: [:meth | 
		aCollection add: (MethodReference new setStandardClass: meth inClass methodSymbol: meth selector)].
	^ aCollection