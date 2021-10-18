testing
testIsAllSeparators

	| strm | 
	self deny: 'abcde' isAllSeparators.
	self assert: String cr isAllSeparators.
	self assert: '     ' isAllSeparators.
	strm := WriteStream on: String new.
	strm cr; lf; space; tab.
	strm nextPut: Character newPage.
	self assert: strm contents isAllSeparators