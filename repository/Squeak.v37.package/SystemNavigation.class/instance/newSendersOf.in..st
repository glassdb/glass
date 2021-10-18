private
newSendersOf: aSelector in: aclassSet
  "really looking for references to the selector in method literals, even if embedded in array structure or within its pragmas."

  "Returns an Array of GsMethods that send the given selector.  "

  | result cset cls aSymbol |
  aSymbol := aSelector asSymbol.
  result := IdentitySet new.
  (aclassSet isKindOf: ClassSet)
    ifFalse: [ cset := ClassSet withAll: aclassSet ]
    ifTrue: [ cset := aclassSet ].
  cset := cset sortAscending.
  1 to: cset size do: [ :i | 
    cls := cset at: i.
    2
      timesRepeat: [ 
        result addAll: (cls methodsReferingToLiteral: aSymbol).
        cls := cls class ] ].
  ^ result