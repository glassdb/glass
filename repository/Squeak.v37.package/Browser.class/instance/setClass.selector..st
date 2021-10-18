initialize-release
setClass: aBehavior selector: aSymbol
	"Set the state of a new, uninitialized Browser."

	| isMeta aClass messageCatIndex |
	aBehavior ifNil: [^ self].
	(aBehavior isKindOf: Metaclass3)
		ifTrue: [
			isMeta := true.
			aClass := aBehavior theNonMetaClass]
		ifFalse: [
			isMeta := false.
			aClass := aBehavior].
	self selectCategoryForClass: aClass.
	self classListIndex: (
		(self _listClassesIn: ((System myUserProfile dictionaryAndSymbolOf: aClass) at: 1))
			indexOf: aClass name).
	self metaClassIndicated: isMeta.
	aSymbol ifNil: [^ self].
	messageCatIndex := self messageCategoryList indexOf: (aClass categoryOfSelector: aSymbol).
	self messageCategoryListIndex: (messageCatIndex > 0
		ifTrue: [messageCatIndex + 1]
		ifFalse: [0]).
	messageCatIndex = 0 ifTrue: [^ self].
	self messageListIndex: (self messageList indexOf: aSymbol asString).