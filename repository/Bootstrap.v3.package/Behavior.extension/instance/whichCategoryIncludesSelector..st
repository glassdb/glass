*bootstrap
whichCategoryIncludesSelector: aSelector 
	"Answer the category of the argument, aSelector, in the organization of 
	the receiver, or answer nil if the receiver does not inlcude this selector."

	^self categoryOfSelector: aSelector