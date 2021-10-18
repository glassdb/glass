*squeak
baseOverridesSqueakCharacterCollection: known

	self 
		addTo: known 
		forBehavior: CharacterCollection 
		overrides: {
			#copyFrom:to: -> 'copyFrom: startIndex to: stopIndex

"Returns a new SequenceableCollection containing the elements of the receiver
 between startIndex and stopIndex, inclusive.  The result is of the same class
 as the receiver, unless the receiver is a Symbol or DoubleByteSymbol,
 in which case the result class is respectively String or DoubleByteString.

 Both startIndex and stopIndex must be positive integers not larger than the
 size of the receiver, with startIndex <= stopIndex.
 If startIndex > stopIndex and both are positive, an empty collection is returned.
 "

| result |
(startIndex > stopIndex) ifTrue: [ 
  stopIndex < 0 ifTrue:[ self _error: #rtErrBadCopyFromTo args: #[stopIndex] ].
  ^ self class new 
].
(startIndex < 1)
   ifTrue: [ ^ self _errorIndexOutOfRange: startIndex].

((stopIndex > self size) _or: [(stopIndex < 0)])
   ifTrue: [ ^ self _errorIndexOutOfRange: stopIndex].

result := (self class _newString: (stopIndex - startIndex + 1)).
self copyFrom: startIndex to: stopIndex into: result startingAt: 1.
^ result
'.
			#matchesAnyOf: -> 'matchesAnyOf: aCollectionOfCharacterColls

"Returns true if the receiver returns true to the message match: with any of
 the objects in the given collection; returns false otherwise.  Examples:

   ''xyz'' matchesAnyOf: #(''xyz'' ''abc*'')
     true
   ''xyz'' matchesAnyOf: #(''ayz'' ''abc'')
     false
   ''x#z'' matchesAnyOf: #(''x@z'' ''*'')
     false

 The class JISString does not support this method."

aCollectionOfCharacterColls do: [:coll |
  (self match: coll) ifTrue: [ ^true ]
].
^false
'.
			#subStrings: -> 'subStrings: aCharacter
  "Returns an Array of CharacterCollections in which each element represents a
   substring separated by aCharacter.  The result will include empty substrings when
   two adjacent separators exist, as well as if a separator is the first or last element."

  | result startIndex endIndex |
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
'.
	}