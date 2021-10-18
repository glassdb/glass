*squeak
squeakSubStrings: specialChars

  | result startIndex endIndex |
  result := Array new.
  startIndex := 1.

  [ endIndex := self indexOfAnyOf: specialChars startingAt: startIndex.
    endIndex == 0
  ] whileFalse: [
    (endIndex > startIndex) ifTrue:[
       result add: (self copyFrom: startIndex to: endIndex - 1)
    ].
    startIndex := endIndex + 1
  ].
  (startIndex <= self size)
     ifTrue: [ result add: (self copyFrom: startIndex to: self size)].

  ^ result.