testing
testDoSeparatedBy

	| ar count separatorCount | 
	ar := { 1. 2. 3.  4. 5.  6}.
	separatorCount := 0.
	ar 
		do: [:each | count := each] 
		separatedBy: [
			separatorCount := separatorCount + 1.
			self assert: separatorCount == count].
	separatorCount := count := 0.
	ar asSet
		do: [:each | count := count + 1] 
		separatedBy: [
			separatorCount := separatorCount + 1.
			self assert: separatorCount == count].