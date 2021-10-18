query
allBehaviorsDo: aBlock

	self classOrganizer classes do: [:cls | 
		aBlock value: cls.
		aBlock value: cls class
	].