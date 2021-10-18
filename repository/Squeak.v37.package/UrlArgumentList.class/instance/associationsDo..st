enumerating
associationsDo: aBlock
	self do: [:each | 
		aBlock value: each]