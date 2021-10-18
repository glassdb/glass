*squeak-dependents access
removeDependent: anObject
	"Remove the given object as one of the receiver's dependents."

	| dependents |
	dependents _ self dependents reject: [:each | each == anObject].
	self myDependents: (dependents isEmpty ifFalse: [dependents]).
	^ anObject