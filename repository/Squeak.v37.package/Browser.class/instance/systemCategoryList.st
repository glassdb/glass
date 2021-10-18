system category list
systemCategoryList
	"Answer the class categories modelled by the receiver."

	^System myUserProfile symbolList asArray collect: [ :e | e name ]