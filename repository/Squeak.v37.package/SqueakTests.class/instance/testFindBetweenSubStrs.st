testing
testFindBetweenSubStrs

	| delims str substrs |
	delims := { $|. '<<'. }.
	str := 'abcd|||def|||ghi|<<jkl<m'.
	substrs := (str findBetweenSubStrs: delims) asArray.
	self assert: substrs = {'abcd'. 'def'. 'ghi'. 'jkl<m' }