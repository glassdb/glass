tests
testIssue20
  "https://github.com/GsDevKit/GsDevKit/issues/20"

  | x |
  NumberParser defaultParserClass: SqNumberParser.
  self assert: '7.3470570000000004E+02' asNumber = 7.3470570000000004.
  NumberParser defaultParserClass: ExtendedNumberParser.
  self assert: (x := '7.347057000000000E+02' asNumber) = 7.347057000000000e02