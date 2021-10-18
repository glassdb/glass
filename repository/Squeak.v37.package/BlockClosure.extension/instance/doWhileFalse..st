*squeak
doWhileFalse: conditionBlock
	"Evaluate the receiver once, then again as long the value of conditionBlock is false."
 
	[ true ] whileTrue: [ | res |
		res := self value.
		conditionBlock value ifTrue:[ ^ res ]]