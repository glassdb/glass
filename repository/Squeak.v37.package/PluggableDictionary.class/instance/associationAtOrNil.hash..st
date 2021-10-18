Private
associationAtOrNil: aKey hash: aHashVal

"Returns the Association with key aKey.  If no such Association exists, returns
 nil.  The search is only done in the hash chain that corresponds to aHashVal."

| index anAssoc |

anAssoc := self _at: aHashVal.

(anAssoc == nil) ifTrue: [ ^ nil ].

(anAssoc _isSmallInteger)
  "There is a collision. Follow the chain."
  ifTrue: [
    index := anAssoc.
    [nil ~~ index]
    whileTrue: [
      anAssoc := self _at: index.
      (equalBlock == nil
		ifTrue: [ anAssoc key = aKey ]
		ifFalse: [ equalBlock value: anAssoc key value: aKey ])
        ifTrue: [^ anAssoc]
        ifFalse: [index := self _at: (index + 1)].
      ].
    ^ nil.
    ].

(equalBlock == nil
		ifTrue: [ anAssoc key = aKey ]
		ifFalse: [ equalBlock value: anAssoc key value: aKey ])
  ifTrue: [ ^ anAssoc ].

^ nil.