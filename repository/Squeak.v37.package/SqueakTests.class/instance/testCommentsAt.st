testing
testCommentsAt

	| comments |
	comments := self class commentsAt: #noCommentMethod.
	self assert: comments isEmpty.
	comments := self class commentsAt: #onlyCommentMethod.
	self assert: (comments at: 1) = 'This is a comment'.
	comments := self class commentsAt: #onlyCommentMethodWith:multiple:args:.
	self assert: (comments at: 4) = 'This is the second comment'.
	comments := self class commentsAt: #commentMethodWith:multiple:args:.
	self assert: (comments at: 5) = 'final comment'.