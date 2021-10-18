*squeak
- operand
	"a little ugly but this is how squeak does it"
	^ (operand respondsTo: #asDateAndTime) 
		 	ifTrue: [ self asDateAndTime - operand   ]
		 	ifFalse: [ self + (operand negated) ].