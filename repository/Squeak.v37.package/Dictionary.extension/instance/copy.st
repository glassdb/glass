*squeak-accessing
copy
	"Must copy the associations, or later store will affect both the
original and the copy"

	| copy |
	copy := self class new: self size.
	self associationsDo: [ :anAssn |
		copy add: (Association key: anAssn key value: anAssn value)].
	^copy