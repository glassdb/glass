*squeak
doWithIndex: t1 
	| t2 |
	t2 := 0.
	self
		do: [:t4 | t1 value: t4 value: (t2 := t2 + 1)]