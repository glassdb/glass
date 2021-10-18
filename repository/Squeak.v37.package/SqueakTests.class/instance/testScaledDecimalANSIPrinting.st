testing
testScaledDecimalANSIPrinting
  | printBlock |
  printBlock := [ :sd | 
  | aStream |
  aStream := WriteStream on: String new.
  sd _printAsDateAndTimeANSISecondsOn: aStream.
  aStream contents ].
  self assert: (printBlock value: (ScaledDecimal for: 0 scale: 6)) equals: '00'.
  self assert: (printBlock value: (ScaledDecimal for: 1 scale: 6)) equals: '01'.
  self assert: (printBlock value: (ScaledDecimal for: 10 scale: 6)) equals: '10'.
  self assert: (printBlock value: (ScaledDecimal for: 59 scale: 6)) equals: '59'.
  self
    assert: (printBlock value: (ScaledDecimal for: 0.1 scale: 6))
    equals: '00.1'.
  self
    assert: (printBlock value: (ScaledDecimal for: 59.123456 scale: 6))
    equals: '59.123456'.
  self
    assert: (printBlock value: (ScaledDecimal for: 59.123 scale: 6))
    equals: '59.123'