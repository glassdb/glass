accessing
detect: aBlock

	firstLevel keysAndValuesDo: [ :x :v |
		v do: [ :y | (aBlock value: x@y) ifTrue: [^x@y]]
	].
	^nil