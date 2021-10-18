accessing
at: key ifAbsent: aBlock 
	| value valueSize |
	value := super at: key ifAbsent: [^aBlock value].
	valueSize := value size.
	0 = valueSize 
		ifTrue: 
			["is this not absent?"

			value := aBlock value].
	value := (1 = valueSize) ifTrue: [value first] ifFalse: [value copy].
	^value