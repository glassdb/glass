Accessing
associationAt: aKey otherwise: defaultValue

"Returns the Association with key aKey.  If no such Association
 exists, returns the given default value."

| index anAssoc |

aKey == nil ifTrue:[ ^ defaultValue ] .

index := self hashFunction: aKey.
anAssoc := self _at: index.

(anAssoc == nil) ifTrue:[^ defaultValue ].

(anAssoc _isSmallInteger)
  "There is a collision. Follow the chain."
  ifTrue: [
    index := anAssoc.
    [index ~~ nil]
    whileTrue: [
      anAssoc := self _at: index.
	(equalBlock == nil
		ifTrue: [ anAssoc key = aKey ]
		ifFalse: [ equalBlock value: anAssoc key value: aKey ])
        ifTrue: [^ anAssoc]
        ifFalse: [index := self _at: (index + 1)].
      ].
    ^ defaultValue
    ].

(equalBlock == nil
		ifTrue: [ anAssoc key = aKey ]
		ifFalse: [ equalBlock value: anAssoc key value: aKey ])
  ifTrue: [ ^ anAssoc ].

^ defaultValue