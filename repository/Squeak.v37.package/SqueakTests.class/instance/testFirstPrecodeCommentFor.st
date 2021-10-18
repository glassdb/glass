testing
testFirstPrecodeCommentFor

	| comment |
	comment := self class firstPrecodeCommentFor: #noCommentMethod.
	self assert: comment isEmptyOrNil.
	comment := self class firstPrecodeCommentFor: #onlyCommentMethod.
	self assert: comment = '"This is a comment"'.
	comment := self class firstPrecodeCommentFor: #onlyCommentMethodWith:multiple:args:.
	self assert: comment = '"This is a comment"'.
	comment := self class firstPrecodeCommentFor: #commentMethodWith:multiple:args:.
	self assert: comment = '"This is a comment"'.