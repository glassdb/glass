accessing
decimalPoint

	decimalPoint ifNil: [ decimalPoint := Locale decimalPoint first ].
	^decimalPoint