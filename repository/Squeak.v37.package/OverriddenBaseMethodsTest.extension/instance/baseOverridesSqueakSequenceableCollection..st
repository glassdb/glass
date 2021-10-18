*squeak
baseOverridesSqueakSequenceableCollection: known

	self 
		addTo: known 
		forBehavior: SequenceableCollection 
		overrides: {
			#atAllPut: -> 'atAllPut: anObject

"Assigns anObject to each of the receiver''s elements and returns anObject."

1 to: self size do: [ :index | self at: index put: anObject].
^ anObject.
'.
			#first: -> 'first: anObject

"Stores the given object in the first position in the receiver and returns
 anObject."

"Note: In GemStone 4.1 and earlier versions, this method returned the receiver."

^ self at: 1 put: anObject.
'.
			#last -> 'last

"Returns the last element of the receiver.  Generates an error if the receiver
 is empty."

(self size == 0)
ifTrue: "attempt to access an empty Collection"
   [ ^ self _error: #objErrCollectionEmpty].
^self at: self size
'.
			#last: -> 'last: anObject

"Stores the given object in the last position in the receiver and returns
 anObject."

"Note: in GemStone 4.1 and earlier versions, this method returned the receiver."

^ self at: (self size) put: anObject.
'.
			#copyFrom:to: -> 'copyFrom: startIndex to: stopIndex

"Returns a new SequenceableCollection containing the elements of the receiver
 between startIndex and stopIndex, inclusive.  The result is of the same class
 as the receiver.

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

result := (self class new: (stopIndex - startIndex + 1)).
self copyFrom: startIndex to: stopIndex into: result startingAt: 1.
^ result
'.
	}