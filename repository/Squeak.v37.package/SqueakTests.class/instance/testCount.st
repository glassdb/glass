testing
testCount

	| ar res | 
	ar := { 1->2. 3 -> 4. 5 -> 6}.
	res := ar count: [:assoc | assoc key == 1 or: [assoc value == 4] ].
	self assert: res == 2