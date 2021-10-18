private
attributesOf: type
	"Private.
	Answer the TextAttributes that are used to display text of the given type."

	type == #insert
		ifTrue: [ ^{ TextColor red } ].
	type == #remove
		ifTrue: [ ^{ TextEmphasis struckOut . TextColor blue } ].
	^{ TextEmphasis normal . TextColor black }