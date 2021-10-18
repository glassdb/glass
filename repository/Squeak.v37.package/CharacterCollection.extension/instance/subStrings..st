*squeak
subStrings: aCharacter
  "Returns an Array of CharacterCollections in which each element represents a
   substring separated by aCharacter.  The result will include empty substrings when
   two adjacent separators exist, as well as if a separator is the first or last element."

  | result startIndex endIndex |
  aCharacter isCharacter not ifTrue: [ ^self squeakSubStrings: aCharacter ].
  result := Array new.
  startIndex := 1.

  [ endIndex := self indexOf: aCharacter startingAt: startIndex.
    endIndex == 0
  ] whileFalse: [
    (endIndex == startIndex) ifTrue:[ result add: self class _newString ].
    (endIndex > startIndex) ifTrue:[
       result add: (self copyFrom: startIndex to: endIndex - 1)
    ].
    startIndex := endIndex + 1
  ].
  (startIndex > self size)
     ifTrue:[ result add:  self class _newString]
     ifFalse:[ result add: (self copyFrom: startIndex to: self size)].

  ^ result.