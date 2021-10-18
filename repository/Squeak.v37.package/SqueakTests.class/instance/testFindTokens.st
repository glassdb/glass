testing
testFindTokens


	self assert: ('<abcdef>' findTokens: '<>') asArray = {'abcdef'}.
	self assert: ('|abcd|efgh' findTokens: $|) asArray = {'abcd'. 'efgh'}.
	self assert: ('|abcd|efgh|' findTokens: $|) asArray = {'abcd'. 'efgh'}.
	self assert: ('|abcd|efgh|||||ijk' findTokens: $|) asArray = {'abcd'. 'efgh'. 'ijk'}.
	self assert: ('abcd|efgh|||||ijk' findTokens: $|) asArray = {'abcd'. 'efgh'. 'ijk'}.