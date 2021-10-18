*squeak
hashMultiply
	"Truncate to 28 bits and hashMultiply"

	| short low |
	short := self bitAnd: 16rFFFFFFF.
	low := short bitAnd: 16383.
	^(16r260D * low + ((16r260D * (short bitShift: -14) + (16r0065 * low) bitAnd: 16383) * 16384))
			bitAnd: 16r0FFFFFFF