testing
testCopyWithoutAll

	| ar1 ar2 ans |
	ar1 := { 1. 2. 3.  4. 5.  6}.
	ar2 := { 2. 3.  4. 5. }.
	ans := { 1.  6}.
	self assert: (ar1 copyWithoutAll: ar2) = ans.

	(ar1 asSet copyWithoutAll: ar2) do: [:each |
		self assert: (ans includes: each) ].