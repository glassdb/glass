Error Handling
doesNotUnderstand: aMessageDescriptor

	caughtIt := true.
	^aMessageDescriptor sendTo: self class