tests - Float
testFloatFromStringWithExponent
  "This covers parsing in Number>>readFrom:"

  | aFloat |
  aFloat := '1.0e-14' asNumber.
  self assert: 1.0e-14 = aFloat.
  aFloat := '1.0e-14 1' asNumber.
  self assert: 1.0e-14 = aFloat.
  aFloat := '1.0e-14e' asNumber.
  self assert: 1.0e-14 = aFloat.
  aFloat := '1.0e14e' asNumber.
  self assert: 1.0e14 = aFloat.
  NumberParser defaultParserClass == SqNumberParser
    ifTrue: [ 
      aFloat := '1.0e+14e' asNumber.	"Plus sign is not parseable"
      self assert: 1.0 = aFloat ]