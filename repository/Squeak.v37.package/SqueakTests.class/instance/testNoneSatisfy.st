testing
testNoneSatisfy

	| ar | 
	ar := { 1->2. 3 -> 4. 5 -> 6}.
	self assert: (ar asSet noneSatisfy: [:each | each key == 2 ]).
	self assert: (ar noneSatisfy: [:each | each key == 2 ]).

	self deny: (ar asSet noneSatisfy: [:each | each key == 5 ]).
	self deny: (ar noneSatisfy: [:each | each key == 5 ]).