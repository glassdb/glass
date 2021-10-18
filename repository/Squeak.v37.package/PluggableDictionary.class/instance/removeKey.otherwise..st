Removing
removeKey: aKey otherwise: defaultValue

"Removes an element from the receiver with key aKey and returns an Association.
 If an element with key aKey is not present, returns defaultValue."

"Note: In GemStone 4.1, this method checked for an element identical to 
 anAssociation. Also, it returned the receiver."

| prevIndex index anAssociation |

index := self hashFunction: aKey .
anAssociation := self _at: index.

(anAssociation == nil) ifTrue: [^ defaultValue ].

(anAssociation _isSmallInteger)
  ifTrue: [
    "Need to follow the collision chains."
    prevIndex := index.
    index := anAssociation.
    [index ~~ nil]
    whileTrue: [
      anAssociation := self _at: index.
      (equalBlock == nil
		ifTrue: [ anAssociation key = aKey ]
		ifFalse: [ equalBlock value: anAssociation key value: aKey ]) 
        ifTrue: [
           self basicAt: prevIndex put: (self _at: (index + 1)).
           self basicAt: index put: nil.
           self basicAt: (index + 1) put: nil.
           count := count - 1.
           ^ anAssociation.
           ]
        ifFalse: [
          "Go to the next one."
          prevIndex := index + 1.
          index := self _at: (index + 1)
          ].
      ].
    ^ defaultValue
    ].

(equalBlock == nil
		ifTrue: [ anAssociation key = aKey ]
		ifFalse: [ equalBlock value: anAssociation key value: aKey ]) ifTrue:[
  self basicAt: index put: nil.
  count := count - 1.
  ^ anAssociation.
  ].
^ defaultValue