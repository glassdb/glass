*squeak
matchesAnyOf: aCollectionOfCharacterColls

"Returns true if the receiver returns true to the message match: with any of
 the objects in the given collection; returns false otherwise.  Examples:

   'xyz' matchesAnyOf: #('xyz' 'abc*')
     true
   'xyz' matchesAnyOf: #('ayz' 'abc')
     false
   'x#z' matchesAnyOf: #('x@z' '*')
     false

 The class JISString does not support this method."

aCollectionOfCharacterColls do: [:coll |
  (self gemstoneMatch: coll) ifTrue: [ ^true ]
].
^false