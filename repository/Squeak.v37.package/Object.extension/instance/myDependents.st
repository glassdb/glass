*squeak-bootstrap
myDependents
	"Private. Answer a list of all the receiver's dependents."

	| d |
	d := SessionTemps current 
		at: #'Monticello-Dependents' 
		ifAbsent: [
			SessionTemps current 
				at: #'Monticello-Dependents'
				put: Dictionary new ].
	^d at: self ifAbsent: [ nil ].