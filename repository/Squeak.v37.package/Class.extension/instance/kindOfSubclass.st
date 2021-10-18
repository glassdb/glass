*squeak
kindOfSubclass
   "for Squeak chunk format fileout only"
    | type opts |
    type := self typeOfClass . "invokes Behavior>>typeOfClass"
    (opts := self _optionsArray) size > 0 ifTrue:[
      self error:'class options not supported for Squeak chunk format fileout'
    ].
    type == #normal ifTrue: [^ ' subclass: '].
    type == #variable ifTrue: [^ ' variableSubclass: '].
    type == #bytes ifTrue: [^ ' variableByteSubclass: '].
    self error: 'Unrecognized class type'