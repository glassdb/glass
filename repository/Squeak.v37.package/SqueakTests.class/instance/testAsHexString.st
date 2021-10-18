testing
testAsHexString


	self assert: 4 asHexString = '4'.
	self assert: 10 asHexString = 'a'.
	self assert: 15 asHexString = 'f'.
	self assert: 32 asHexString = '20'.
	self assert: #[122 43 213 7] asHexString asLowercase = '7a2bd507'