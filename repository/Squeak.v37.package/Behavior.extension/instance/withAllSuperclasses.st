*squeak
withAllSuperclasses
	"Answer an OrderedCollection of the receiver and the receiver's 
	superclasses. The first element is the receiver, 
	followed by its superclass; the last element is Object."

	| temp |
	temp _ self allSuperClasses asOrderedCollection.
	temp addFirst: self.
	^ temp