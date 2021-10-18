*squeak
ifEmpty: aBlock
	self size == 0 ifTrue: [ ^aBlock value ]