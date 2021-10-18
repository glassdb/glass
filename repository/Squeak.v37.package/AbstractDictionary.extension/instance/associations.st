*squeak-accessing
associations
	"Answer an OrderedCollection containing the receiver's associations in an 
	arbitrary order."

	| aCollection |
	aCollection := Array new.
	self associationsDo: [:assn | aCollection add: assn].
	^aCollection