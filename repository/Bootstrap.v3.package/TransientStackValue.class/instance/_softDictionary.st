private
_softDictionary
  | dict |
  dict := SessionTemps current at: #'TransientStackValue' otherwise: nil.
  dict == nil
    ifTrue: [ 
      dict := IdentityKeySoftValueDictionary new.
      SessionTemps current at: #'TransientStackValue' put: dict ].
  ^ dict