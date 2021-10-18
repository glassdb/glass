indexing support
_removeIndexParticipation: refs for: oldObject

	refs isEmpty ifFalse: [ self error: 'Instances of ProtoObject should not participate in an index' ]