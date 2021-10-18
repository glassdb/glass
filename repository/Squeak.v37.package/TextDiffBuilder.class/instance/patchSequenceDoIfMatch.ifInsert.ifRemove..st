creating patches
patchSequenceDoIfMatch: matchBlock ifInsert: insertBlock ifRemove: removeBlock
	"I'm the general purpose method to iterate through the patch sequence. See my senders to learn how to use me."

	self buildPatchSequence do:[:assoc | | type string | 
		type := assoc key.
		string := assoc value.
		type == #insert
			ifTrue: [ insertBlock value: string ]
			ifFalse: [ 
				type == #remove
					ifTrue: [ removeBlock value: string ]
					ifFalse: [ matchBlock value: string ]]].