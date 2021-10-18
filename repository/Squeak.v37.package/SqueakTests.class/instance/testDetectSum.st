testing
testDetectSum

	| ar | 
	ar := { 1. 2. 3.  4. 5.  6}.
	self assert: (ar asSet detectSum: [:each | each ]) == 21.
	self assert: (ar detectSum: [:each | each ]) == 21.