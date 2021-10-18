query
allReferencesTo: aSymbol 
	"Answer a Collection of all the methods that refer to <aSymbol>"

	| aCollection ar |
	aCollection _ OrderedCollection new.
	ar := self classOrganizer referencesTo: aSymbol.
	(ar at: 1) do: [:meth | 
		aCollection add: (MethodReference new setStandardClass: meth inClass methodSymbol: meth selector)].
	^ aCollection