tests - Integer
testcheckForCoverage
  "self debug: #testcheckForCoverage"

  "Tests for old semantics of Number>>readFrom:"

  NumberParser defaultParserClass == SqNumberParser
    ifTrue: [ 
      self should: [ '.' asNumber = 0 ] raise: Error.
      self should: [ '.1' asNumber = 0.1 ] raise: Error ].
  self assert: '0.0' asNumber = 0.
  self assert: '0.1' asNumber = 0.1.
  self assert: '1.1' asNumber = 1.1.
  self assert: '-1' asNumber = -1