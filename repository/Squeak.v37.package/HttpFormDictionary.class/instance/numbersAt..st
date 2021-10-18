accessing
numbersAt: key
	^(self rawAt: key) collect: [:value |
		[value asNumber] ifError: [:err :rcvr | Float nan]]