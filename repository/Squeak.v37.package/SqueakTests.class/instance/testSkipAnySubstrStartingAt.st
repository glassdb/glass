testing
testSkipAnySubstrStartingAt


	| delims str index |
	delims := { $|. '<<'. }.
	str := 'abcd|||def|||ghi|<<jkl<m'.
	index := str skipAnySubStr: delims startingAt: 5.
	self assert: index == 8.
	index := str skipAnySubStr: delims startingAt: index+3.
	self assert: index == 14.
	index := str skipAnySubStr: delims startingAt: index+3.
	self assert: index == 20.
	index := str skipAnySubStr: delims startingAt: index+3.
	self assert: index == 23.