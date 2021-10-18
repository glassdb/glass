*squeak-accessing
doIfNotNil: aBlock
	self deprecated: 'use ifNotNilDo:'.
	^ self ifNotNilDo: aBlock