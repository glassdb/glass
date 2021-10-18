testing
testDifference

	| ar1 ar2 ans  | 
	ar1 := { 1. 2. 3.  4. 5.  6}.
	ar2 := {2. 3. 4. 6}.
	ans := {1. 5}.
	self assert: (ar1 difference: ar2) = ans.
	
	(ar1 asSet difference: ar2 asSet) do: [:each |
		self assert: (ans includes: each)].