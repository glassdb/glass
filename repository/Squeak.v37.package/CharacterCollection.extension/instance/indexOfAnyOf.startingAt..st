*squeak
indexOfAnyOf: specialChars startingAt: oldPos

	oldPos to: self size do: [:i |
		(specialChars includes: (self at: i)) ifTrue: [ ^i ]
	].
	^0