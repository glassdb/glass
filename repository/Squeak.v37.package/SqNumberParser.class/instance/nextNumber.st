parsing-public
nextNumber
  "main method for reading a number.
	This one can read Float Integer and ScaledDecimal"

  | numberOfTrailingZeroInIntegerPart |
  base := 10.
  neg := self peekSignIsMinus.
  integerPart := self nextUnsignedIntegerOrNilBase: base.
  integerPart
    ifNil: [ 
      "This is not a regular number beginning with a digit
		It is time to check for exceptional condition NaN and Infinity"
      ^ self readNamedFloatOrFail ].
  numberOfTrailingZeroInIntegerPart := nDigits - lastNonZero.
  ((sourceStream peekFor: $r) or: [ sourceStream peekFor: $# ])
    ifTrue: [ 
      "<base>r<integer>"
      (base := integerPart) < 2
        ifTrue: [ ^ self expected: 'an integer greater than 1 as valid radix' ].
      self peekSignIsMinus
        ifTrue: [ neg := neg not ].
      integerPart := self nextUnsignedIntegerBase: base.
      numberOfTrailingZeroInIntegerPart := nDigits - lastNonZero ].
  ^ self peekForDecimalPoint
    ifTrue: [ 
      self
        readNumberWithFractionPartNumberOfTrailingZeroInIntegerPart:
          numberOfTrailingZeroInIntegerPart ]
    ifFalse: [ self makeIntegerOrScaledInteger ]