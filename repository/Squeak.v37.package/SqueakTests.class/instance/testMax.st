testing
testMax

	| ar | 
	ar := { 1. 2. 3.  4. 5.  6}.
	self assert: (ar asSet max) == 6.
	self assert: (ar max) == 6.