*squeak
baseOverridesSqueakObject: known
	self
		addTo: known
		forBehavior: Object
		overrides: {
			#'copy' -> 'copy

"Returns a copy of the receiver which shares the receiver''s instance
 variables.

 Tags of the receiver are not copied."

<primitive: 55>
self _primitiveFailed: #copy .
self _uncontinuableError
'.
	}