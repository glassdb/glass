*squeak
printStringRadix: base showRadix: aBoolean
  "Returns a String that describes the receiver in the specified radix.
 The base b must be 2 <= b <= 36."

  | str b |
  b := base.
  (b between: 2 and: 36)
    ifFalse: [ ^ self _error: #'rtErrInvalidArgument' args: {b} ].
  b == 10
    ifTrue: [ str := self asString ]
    ifFalse: [ 
      b == 16
        ifTrue: [ str := self _asHexString: '0123456789ABCDEF' ]
        ifFalse: [ 
          | abs digits quorem neg |
          self < 0
            ifTrue: [ 
              neg := true.
              abs := self negated ]
            ifFalse: [ abs := self ].
          digits := #($0 $1 $2 $3 $4 $5 $6 $7 $8 $9 $A $B $C $D $E $F $G $H $I $J $K $L $M $N $O $P $Q $R $S $T $U $V $W $X $Y $Z).
          quorem := {nil.
          nil}.
          str := String new.
          abs = 0
            ifTrue: [ str add: $0 ].
          [ abs > 0 ]
            whileTrue: [ 
              abs quoRem: b into: quorem.
              str add: (digits at: (quorem at: 2) + 1).
              abs := quorem at: 1 ].
          neg ifNotNil: [ str add: $- ].
          str := str reverse ] ].
  aBoolean
    ifTrue: [ 
      | res |
      (res := b asString)
        add: $r;
        addAll: str.
      ^ res ].
  ^ str