*squeak-copying
copyUpTo: anObject
  "Answer all elements up to but not including anObject. If there
  is no such object, answer a copy of the receiver."

| idx |
idx := self indexOf: anObject startingAt: 1 .
idx == 0 ifTrue:[ 
  ^ self copy 
] ifFalse:[
  ^ self copyFrom: 1 to: idx - 1
]