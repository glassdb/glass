message category list
selectedMessageCategoryName
	"Answer the message selector of the currently selected message, if any. 
	Answer nil otherwise."

	| aList |
	messageCategoryListIndex = 0 ifTrue: [^ nil].
	^ (aList := self messageCategoryList) size >= messageCategoryListIndex
		ifTrue:
			[aList at: messageCategoryListIndex]
		ifFalse:
			[nil]