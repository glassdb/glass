accessing
default
	Default isNil ifTrue: [Default _ self new].
	^Default