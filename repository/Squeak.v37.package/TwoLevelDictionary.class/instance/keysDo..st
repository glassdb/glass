accessing
keysDo: aBlock

	firstLevel keysAndValuesDo: [ :x :v |
		v keysDo: [ :y | aBlock value: x@y]
	].