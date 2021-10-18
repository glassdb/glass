*squeak
lines
	"Return a collection with the string-lines of the receiver."

	| input lines |
	input := self contents readStream.
	lines := Array new.
	self linesDo: [:each | lines add: each ].
	^lines