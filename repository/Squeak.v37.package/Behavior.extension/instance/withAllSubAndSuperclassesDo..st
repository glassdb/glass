*squeak
withAllSubAndSuperclassesDo: aBlock

	self withAllSubclassesDo: aBlock.
	self allSuperClassesDo: aBlock.