accessing
booleanAt: key
	^(self rawAt: key) first = 'true'