accessing
contents: input notifying: aController 
	"The retrieved information has changed and its
	source must now be
	updated. The information can be a variety of
	things, depending on
	the list selections (such as templates for class or
	message definition,
	methods) or the user menu commands (such as
	definition, comment,
	hierarchy). Answer the result of updating the
	source. "
	| aString aText theClass newClass |
	self changed: #annotation.
	aString := input asString.
	aText := input.
	editSelection == #editClass | (editSelection == #newClass)
		ifTrue: [
			newClass := aString evaluate.
			newClass ifNil: [ ^false ].
			^true].
	editSelection == #editComment
		ifTrue: [theClass := self selectedClass.
			theClass
				ifNil: [self perform: #inform: with: 'You must select a class
before giving it a comment.'.
					^ false].
			theClass classComment: aText stamp: theClass changeStamp.
			self changed: #classCommentText.
			^ true].
	editSelection == #editMessage | (editSelection == #newMessage)
		ifTrue: [^ self okayToAccept
				and: [self compileMessage: aText notifying: aController]].
	editSelection == #none
		ifTrue: [self perform: #inform: with: 'This text cannot be accepted
in this part of the browser.'.
			^ false].
	self error: 'unacceptable accept'