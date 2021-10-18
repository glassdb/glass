testing
testLastIndexOf

	| ar | 
	ar := { 1. 2. 3. 4. 5.  0. 6.  1. 2. 3. 4. 5.  6.  1. 2. 3. 4. 5.  6}.
	self assert: (ar lastIndexOf: 5) == (ar size - 1).
	self assert: (ar lastIndexOf: 7) == 0.
	self assert: (ar lastIndexOf: 0) == 6.