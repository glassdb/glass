testing
testFindTokensKeep


	self assert: ('<abc*def>' findTokens: '<*>' keep: '*') asArray = {'abc'. '*'. 'def'}.