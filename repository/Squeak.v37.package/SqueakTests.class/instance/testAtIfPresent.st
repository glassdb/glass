testing
testAtIfPresent
	| dictionary |
	dictionary := Dictionary new.
	dictionary at: '1' put: 'foo'.
	self assert: (dictionary at: '1' ifPresent: [ :v | v ]) = 'foo'.
	self assert: (dictionary at: '2' ifPresent: [ :v | 'not' ]) isNil