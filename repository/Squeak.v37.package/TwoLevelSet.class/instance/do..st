accessing
do: aBlock

	firstLevel keysAndValuesDo: [ :x :v |
		v do: [ :y | aBlock value: x@y]
	].