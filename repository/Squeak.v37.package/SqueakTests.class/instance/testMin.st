testing
testMin

	| ar | 
	ar := { 1. 2. 3.  4. 5.  6}.
	self assert: (ar asSet min) == 1.
	self assert: (ar min) == 1.