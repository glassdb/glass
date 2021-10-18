testing
testDetectMin

	| ar | 
	ar := { 1. 2. 3.  4. 5.  6}.
	self assert: (ar asSet detectMin: [:each | each ]) == 1.
	self assert: (ar detectMin: [:each | each ]) == 1.