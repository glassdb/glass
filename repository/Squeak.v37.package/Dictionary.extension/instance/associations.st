*squeak-accessing
associations
	"Answer a Collection containing the receiver's associations."
	| out |
	out _ WriteStream on: (Array new: self size).
	self associationsDo: [:value | out nextPut: value].
	^ out contents