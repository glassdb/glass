*squeak
leadingChar
	"assume Unicode"
	
	^(self asciiValue bitAnd: (16r3FC00000)) bitShift: -22