*squeak-enumerating
difference: aCollection
	"Answer the set theoretic difference of two collections."

|result element |

result := self speciesForSelect new.
1 to: self size do: [ :i|
  element := self at: i.
  (aCollection includes: element) ifFalse: [result add: element]
  ].
^ result