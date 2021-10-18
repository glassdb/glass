indexing support
_restoreIndexParticipation: refs

	refs isEmpty ifFalse: [ self error: 'Instances of ProtoObject should not participate in an index' ]