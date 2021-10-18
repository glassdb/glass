message list
sourceStringPrettifiedAndDiffed
	"Answer a copy of the source code for the selected message."

	| class selector |
	class := self selectedClassOrMetaClass.
	selector := self selectedMessageName.
	(class isNil or: [selector isNil]) ifTrue: [^ 'missing'].

	^class sourceCodeAt: selector.