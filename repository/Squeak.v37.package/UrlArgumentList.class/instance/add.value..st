adding
add: argName value: argValue
	| argAssociation |
	argAssociation _ self argumentNamed: argName.
	argAssociation isNil
		ifTrue: [self add: (argName -> (OrderedCollection with: argValue))]
		ifFalse: [argAssociation value add: argValue]