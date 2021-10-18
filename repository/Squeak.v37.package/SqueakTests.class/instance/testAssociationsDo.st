testing
testAssociationsDo

	| ar dict | 
	ar := { 1->2. 3 -> 4. 5 -> 6}.
	ar asSet associationsDo: [:assoc |
		self assert: (ar includes: assoc) ].
	dict := Dictionary new.
	ar associationsDo: [:assoc |
		dict add: assoc ].
	dict associationsDo: [:assoc |
		self assert: (ar includes: assoc)]