accessing
booleansAt: key
	^(self rawAt: key) collect: [:value | value == 'true']