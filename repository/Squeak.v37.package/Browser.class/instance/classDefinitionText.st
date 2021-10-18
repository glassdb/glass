class functinos
classDefinitionText
	"return the text to display for the definition of the currently selected class"
	| theClass |
	theClass := self selectedClass.
	theClass ifNil: [ ^''].
	^theClass definition