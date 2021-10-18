accessing
contents
	"Depending on the current selection, different information is retrieved.
	Answer a string description of that information. This information is the
	method of the currently selected class and message."

	| comment theClass latestCompiledMethod |
	latestCompiledMethod := currentCompiledMethod.
	currentCompiledMethod := nil.

	editSelection == #none ifTrue: [^ ''].
	editSelection == #newClass 
		ifTrue: [^ (theClass := self selectedClass)
			ifNil:
				[self textForNewClass]
			ifNotNil:
				[Class templateForSubclassOf: theClass category: self selectedSystemCategoryName]].
	editSelection == #editClass 
		ifTrue:
			[^ self classDefinitionText ].
	editSelection == #editComment 
		ifTrue:
			[(theClass := self selectedClass) ifNil: [^ ''].
			comment := theClass classComment.
			^ comment size = 0
				ifTrue: ['This class has not yet been commented.']
				ifFalse: [comment]].
	editSelection == #newMessage
		ifTrue:
			[^ (theClass := self selectedClassOrMetaClass) 
				ifNil: ['']
				ifNotNil: [self textForNewMethod]].
	editSelection == #editMessage
		ifTrue:
			[currentCompiledMethod := latestCompiledMethod.
			^ self selectedMessage].

	self error: 'Browser internal error: unknown edit selection.'