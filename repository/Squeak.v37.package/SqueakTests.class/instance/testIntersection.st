testing
testIntersection

	| ar1 ar2 ans  | 
	ar1 := { 1. 2. 3.  4. 5.  6}.
	ar2 := {3. 4. 6. 10. 16. }.
	ans := {3. 4. 6.}.
	self assert: (ar1 intersection: ar2) = ans.
	
	(ar1 asSet intersection: ar2 asSet) do: [:each |
		self assert: (ans includes: each)].