testing
testDetectMax

	| ar | 
	ar := { 1. 2. 3.  4. 5.  6}.
	self assert: (ar asSet detectMax: [:each | each ]) == 6.
	self assert: (ar detectMax: [:each | each ]) == 6.