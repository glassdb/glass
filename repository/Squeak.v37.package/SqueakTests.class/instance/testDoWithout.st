testing
testDoWithout

	| ar item | 
	item := 3->10.
	ar := { 1. 2. item.  4. 5.  6}.
	ar do: [:each | self assert: each ~~ item] without: item.
	ar do: [:each | self assert: each ~~ item] without: item copy.

	ar asSet do: [:each | self assert: each ~~ item] without: item.
	ar asSet do: [:each | self assert: each ~~ item] without: item copy.