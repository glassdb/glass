*squeak
intersection: aCollection
	"Answer the set theoretic intersection of two collections."

| result each |

result:= self speciesForSelect new.
1 to: self size do:[ :i|
  each := self at: i.
  (aCollection includes: each) ifTrue: [result add: each]
  ].

^result