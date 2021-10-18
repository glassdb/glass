testing
testReadFrom
  "Make sure that readFrom: works for all of the primitive classes handled by SOAP"

  | obj float1 float2 dateAndTime1 dateAndTime2 a b |
  obj := 'this is a string'.
  self assert: (String readFrom: obj printString readStream) = obj.
  obj := obj asSymbol.
  self assert: (Symbol readFrom: obj printString readStream) = obj.
  obj := 1234567890.
  self assert: (Integer readFrom: obj printString readStream) = obj.
  obj := ScaledDecimal fromString: '34.23'.
  self assert: (ScaledDecimal readFrom: obj printString readStream) = obj.
  float1 := 3.422E01.
  float2 := Float readFrom: obj printString readStream.
  self assert: (a := (float1 * 100) truncated) = (b := (float2 * 100) truncated).
  obj := DateAndTime fromString: '2008-10-22T14:52:15-07:00'.
  self assert: (DateAndTime readFrom: obj printString readStream) = obj.
  obj := false.
  self assert: (Boolean readFrom: obj printString readStream) = obj.
  obj := SmallInteger maxVal + 1.
  self assert: (Integer readFrom: obj printString readStream) = obj.
  obj := SmallInteger minVal - 1.
  self assert: (Integer readFrom: obj printString readStream) = obj.
  dateAndTime1 := DateAndTime
    readFrom: '1970-11-22T00:00:00.0000000-07:00' readStream.
  dateAndTime2 := DateAndTime readFrom: '1970-11-22T00:00:00-07:00' readStream.
  self assert: dateAndTime1 = dateAndTime2