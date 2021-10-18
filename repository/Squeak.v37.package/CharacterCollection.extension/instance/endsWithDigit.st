*squeak
endsWithDigit
  "Answer whether the receiver's final character represents a digit.  3/11/96 sw"

  |  mySize |
  ^ (mySize := self size) > 0 and: [ (self at: mySize) isDigit]