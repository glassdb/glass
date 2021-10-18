*squeak
copyWithoutAll: aCollection

"Answer a copy of the receiver that does not contain any elements 
	equal to those in aCollection."

| copy element sz |

copy := self class new.

sz := 0.
1 to: self size do: [:i |
  element := self at: i.
  (aCollection includes: element) 
    ifFalse: [
      sz := sz + 1.
      copy at: sz put: element.
      ]
  ].

^copy