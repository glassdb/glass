testing
testStringSubstring

	
	self assert: ('ab bcd abc' copyWith: 811 asCharacter) substrings = {'ab'. 'bcd'. 'abc' copyWith: 811 asCharacter}.
	
	self assert: '123    4     56' substrings = {'123'. '4'. '56'. }