parsing-private
makeIntegerOrScaledInteger
	"at this point, there is no digit, nor fractionPart.
	maybe it can be a scaled decimal with fraction omitted..."
	
	neg
		ifTrue: [integerPart := integerPart negated].
	self readExponent
		ifTrue:
      [^exponent negative "GemStone now returns a fraction instead of a float. We want a float for negative exponents."
        ifTrue: [integerPart * (base asFloat raisedToInteger: exponent)]
        ifFalse: [integerPart * (base raisedToInteger: exponent)]].
	self readScale
		ifTrue: [^integerPart asScaledDecimal: scale].
	^ integerPart
