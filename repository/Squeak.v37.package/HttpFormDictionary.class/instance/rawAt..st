accessing
rawAt: key
	^super at: key ifAbsent: [self errorKeyNotFound: key]