*squeak-bootstrap
myDependents: aCollectionOrNil
	"Private. Set (or remove) the receiver's dependents list."

	| d |
	d := SessionTemps current 
		at: #'Monticello-Dependents' 
		ifAbsent: [
			SessionTemps current 
				at: #'Monticello-Dependents'
				put: Dictionary new ].
	aCollectionOrNil
		ifNil: [ d removeKey: self ifAbsent: []]
		ifNotNil: [d at: self put: aCollectionOrNil ].