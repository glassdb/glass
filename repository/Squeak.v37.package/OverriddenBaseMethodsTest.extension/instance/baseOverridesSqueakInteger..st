*squeak
baseOverridesSqueakInteger: known

	self 
		addTo: known 
		forBehavior: Integer 
		overrides: {
			"2.3.x only"
			#to: -> 'to: aNumber

"Returns an Array containing all Integers between the receiver and the
 argument."

| nums |

aNumber _validateClass: Integer.
nums := #[].
self to: aNumber do:
  [ :i | nums add: i ].

^nums
'.
	}