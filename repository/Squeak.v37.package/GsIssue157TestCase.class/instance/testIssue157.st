tests
testIssue157

	caughtIt := false.
	self assert: (self fooIssue157). 
	self assert: caughtIt.
	caughtIt := false.
	self assert: (self perform: #fooIssue157).
	self assert: caughtIt.