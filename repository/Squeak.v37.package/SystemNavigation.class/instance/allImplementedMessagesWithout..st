query
allImplementedMessagesWithout: classesAndMessagesPair 
	"Answer a Set of all the messages that are implemented in the system,  
	computed in the absence of the supplied classes and messages. Note this  
	reports messages that are in the absent selectors set."
	| messages absentClasses |
	messages _ IdentitySet new.
	absentClasses _ classesAndMessagesPair first.
	self allClasses do: [:cl |
		((absentClasses includes: cl name)
			ifTrue: [ #() ]
			ifFalse: [Array with: cl with: cl theMetaClass]) 
				do: [:each | messages addAll: each selectors ].
	].
	^ messages