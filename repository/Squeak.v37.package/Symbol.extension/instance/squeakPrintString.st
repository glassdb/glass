*squeak
squeakPrintString

  | res idx lastIdx sz |
res := String new.
res add: $# .
idx := self indexOf: $' startingAt: 1 .
(idx == 0 _or:[ idx > 1000000 ]) ifTrue:[
  res addAll: self .
  ]
ifFalse:[
  lastIdx := 1.
  [ idx == 0 ] whileFalse: [
    res addAll: (self copyFrom: lastIdx to: idx) ; add: $' .
    lastIdx := idx + 1 .
    idx := self indexOf: $' startingAt: lastIdx .
    ].
  sz := self size .
  lastIdx <= sz ifTrue: [
    res addAll: (self copyFrom: lastIdx to: sz)  .
    ].
  ].
^ res