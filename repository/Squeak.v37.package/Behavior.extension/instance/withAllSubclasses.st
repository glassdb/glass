*squeak
withAllSubclasses
	"Answer a Set of the receiver, the receiver's descendent's, and the  
	receiver's descendent's subclasses."

	| ar |
	ar := Array new.
	self withAllSubclassesDo: [:cl | ar add: cl ].
	^ar