*squeak
baseOverridesSqueakInterval: known
	self
		addTo: known
		forBehavior: Interval
		overrides: {
			#'first:' -> 'first: anObject

"Disallowed. Intervals cannot be updated."

^ self shouldNotImplement: #first:
'.
	}