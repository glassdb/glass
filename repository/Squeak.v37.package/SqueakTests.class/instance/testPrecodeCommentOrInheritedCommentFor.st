testing
testPrecodeCommentOrInheritedCommentFor
	"Dependent upon the comment in TestCase>>isLogging"
	
	| comment |
	comment := self class precodeCommentOrInheritedCommentFor: #isLogging.
	self assert: comment = '"By default, we''re not logging failures. If you override this in 
	a subclass, make sure that you override #failureLog"'.