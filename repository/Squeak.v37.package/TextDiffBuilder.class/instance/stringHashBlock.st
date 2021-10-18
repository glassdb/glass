private
stringHashBlock
	"Return a block for use in string hashing"
	| stringSize |
	^[:string| 
		stringSize := string size.
		stringSize = 0 
			ifTrue:[0]
			ifFalse:[ stringSize < 3 
				ifTrue:[(string at: 1) asInteger +
						((string at: string size) asInteger bitShift: 8)]
				ifFalse:[	(string at: 1) asInteger +
						((string at: stringSize // 3 + 1) asInteger bitShift: 4) +
						((string at: stringSize // 2 + 1) asInteger bitShift: 8) +
						((string at: stringSize * 2 // 3 + 1) asInteger bitShift: 12) +
						((string at: stringSize) asInteger bitShift: 16)]]]