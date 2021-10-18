*squeak
withAtLeastNDigits: desiredLength

	| normalized new |
	normalized := self normalize.
	normalized digitLength >= desiredLength ifTrue: [ ^normalized ].
	new := self class _new: desiredLength neg: self negative.
	1 to: desiredLength do: [:i | new digitAt: i put: (self digitAt: i) ].
	^new