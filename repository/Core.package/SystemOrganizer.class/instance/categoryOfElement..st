accessing
categoryOfElement: element 
	"Answer the category associated with the argument, element."

	^self categoryDict keyAtValue: element ifAbsent: [ nil ]