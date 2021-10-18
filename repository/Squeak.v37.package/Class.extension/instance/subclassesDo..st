*squeak
subclassesDo: aBlock 

	self subclasses do: [:cl |
		aBlock value: cl].