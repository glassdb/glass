*squeak
allSubclassesDo: aBlock 

	self allSubclasses do: [:cl |
		aBlock value: cl].