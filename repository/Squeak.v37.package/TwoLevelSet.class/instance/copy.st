accessing
copy

	| answer |

	answer := self class new initialize.
	self do: [ :each |
		answer add: each
	].
	^answer