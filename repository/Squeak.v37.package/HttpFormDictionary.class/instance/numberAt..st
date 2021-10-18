accessing
numberAt: key
	^[(self rawAt: key) first asNumber]
		ifError: [:err :rcvr | Float nan]