testing
testSupermostPrecodeCommentFor
	"Dependent upon the comment in TestCase>>addDependentToHierachy:"
	
	| comment |
	comment := self class supermostPrecodeCommentFor: #addDependentToHierachy:.
	self assert: comment = '"an empty method. for Composite compability with TestSuite"'.