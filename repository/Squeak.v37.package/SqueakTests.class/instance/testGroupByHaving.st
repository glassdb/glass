testing
testGroupByHaving

	| ar res key ans |
	ar := {1->''. 2->'two'. 3->''. 2->'2'. 2->'too' }.
	key := 2.
	ans := {2->'two'. 2->'2'. 2->'too' }.
	res := ar groupBy: [:assoc | assoc key ] 
		having: [:val | val isEmpty not ].
	self assert: (res includesKey: 1) . 
	self assert: (res includesKey: 2). 
	self assert: (res includesKey: 3). 
	(res at: key) do: [:each | self assert: (ans includes: each) ].