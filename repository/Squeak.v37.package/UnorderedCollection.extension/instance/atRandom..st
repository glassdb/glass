*squeak
atRandom: t1 
	| t2 |
	self emptyCheck.
	t2 := t1 nextInt: self size.
	self
		doWithIndex: [:t3 :t4 | 
			t4 == t2
				ifTrue: [^ t3].
			nil].
	^ self errorEmptyCollection