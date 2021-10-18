testing
testPointArithmetic

	self assert: ((1@1) + (2@2)) = (3@3).
	self assert: ((1@1) * (2@2)) = (2@2).
	self assert: ((4@4) - (2@2)) = (2@2).
	self assert: ((4@4) / (2@2)) = (2@2).
	self assert: ((4@4) // (2@2)) = (2@2).
	self assert: ((4@4) \\ (2@2)) = (0@0).
	
	self assert: ((1@1) + 2) = (3@3).
	self assert: ((1@1) + '2') = (3@3).
	self assert: ((1@1) + { 1. 2. 3. 1@1. '1'}) = {2@2. 3@3. 4@4. 2@2. 2@2}.