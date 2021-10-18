*squeak
methodsReferingToLiteral: aLiteral
  | mDict result |
  result := IdentitySet new.
  mDict := self _fullMethodDictEnv0.
  mDict
    valuesDo: [ :gsMethod | 
      | srcOffset |
      srcOffset := gsMethod _sourceOffsetOfFirstSendOf: aLiteral.
      srcOffset ~~ nil
        ifTrue: [ result add: gsMethod ]
        ifFalse: [ 
          (gsMethod _literalsIncludesSymbol: aLiteral value: aLiteral)
            ifTrue: [ result add: gsMethod ]
            ifFalse: [ 
              (gsMethod literals asArray refersToLiteral: aLiteral)
                ifTrue: [ result add: gsMethod ]
                ifFalse: [ 
                  (gsMethod pragmas detect: [ :pragma | pragma hasLiteral: aLiteral ] ifNone: [  ])
                    ~~ nil
                    ifTrue: [ result add: gsMethod ] ] ] ] ].
  ^ result