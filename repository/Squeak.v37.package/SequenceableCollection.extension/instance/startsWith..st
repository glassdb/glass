*squeak
startsWith: start
	| comp |
	self size < start size ifTrue: [^ false].
	comp := true.
	(self first: start size) with: start
		do: [:ea :ea2 | ea = ea2 ifFalse: [comp := false]].
	^ comp