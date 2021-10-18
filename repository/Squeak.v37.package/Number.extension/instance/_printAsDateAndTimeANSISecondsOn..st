*squeak
_printAsDateAndTimeANSISecondsOn: aStream
  self \\ 1 = 0
    ifTrue: [ 
      self < 10
        ifTrue: [ aStream nextPut: $0 ].
      self rounded printOn: aStream ]
    ifFalse: [ 
      "x is either a ScaledDecimal or a Float"
      self asInteger < 10
        ifTrue: [ aStream nextPut: $0 ].
      aStream nextPutAll: self asStringLocaleC ]