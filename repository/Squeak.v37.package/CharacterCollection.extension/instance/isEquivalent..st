*squeak
isEquivalent: aCharCollection
"Returns true if the receiver is equivalent to aCharCollection.  The receiver
 is equivalent to aCharCollection if the receiver contains the same Characters
 as aCharCollection regardless of case or internal representation.  For
 example, if $a is in aCharCollection, it is equivalent to any representation
 of an 'a' in the receiver's character set."

(aCharCollection isKindOf: CharacterCollection)
  ifFalse: [ ^false ].

(self size ~~ aCharCollection size)
  ifTrue: [ ^false ].

1 to: (self size)
  do: [:i | ((self at: i) isEquivalent: (aCharCollection at: i))
            ifFalse: [ ^false ].
      ].
^true