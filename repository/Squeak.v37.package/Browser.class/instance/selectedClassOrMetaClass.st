metaclass
selectedClassOrMetaClass
	"Answer the selected class or metaclass."

	| cls |
	self metaClassIndicated
		ifTrue: [^ (cls := self selectedClass) ifNil: [nil] ifNotNil: [cls class]]
		ifFalse: [^ self selectedClass]