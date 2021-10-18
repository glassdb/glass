*squeak
copyFrom: anotherObject
	"Copy to myself all instance variables I have in common with anotherObject.  This is dangerous because it ignores an object's control over its own inst vars.  "

	| myInstVarNames hisInstVarNames size |
	myInstVarNames := self class allInstVarNames.
	hisInstVarNames := anotherObject class allInstVarNames.
	1 to: (myInstVarNames size min: hisInstVarNames size) do: [:ind |
		(myInstVarNames at: ind) = (hisInstVarNames at: ind) ifTrue: [
			self instVarAt: ind put: (anotherObject instVarAt: ind).
		].
	].
	(self class isIndexable and: [anotherObject class isIndexable]) ifTrue: [
		size := anotherObject basicSize - hisInstVarNames size.
		self size: size.
		1 to: size do: [:ind |
			self basicAt: ind put: (anotherObject basicAt: ind).
		].
	].