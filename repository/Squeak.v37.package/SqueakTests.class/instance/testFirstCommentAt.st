testing
testFirstCommentAt

	| comment |
	comment := self class firstCommentAt: #noCommentMethod.
	self assert: comment isEmptyOrNil.
	comment := self class firstCommentAt: #onlyCommentMethod.
	self assert: comment = 'This is a comment'.
	comment := self class firstCommentAt: #onlyCommentMethodWith:multiple:args:.
	self assert: comment = 'comment'.
	comment := self class firstCommentAt: #commentMethodWith:multiple:args:.
	self assert: comment = 'comment'.