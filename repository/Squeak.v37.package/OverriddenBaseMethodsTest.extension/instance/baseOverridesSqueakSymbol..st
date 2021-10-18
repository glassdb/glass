*squeak
baseOverridesSqueakSymbol: known

	self 
		addTo: known 
		forBehavior: Symbol 
		overrides: {
			#keywords -> 'keywords

"Returns a collection of the keywords in the receiver if the receiver is
 a keyword message selector. Returns an empty Array otherwise."

| copy result |

copy := (String withAll: self) copyReplaceAll: '':'' with: '' ''.
result := copy asArrayOfSubstrings collect: [ :each | each , $:].
result do: [ :each | each isKeyword ifFalse: [ ^ #[] ]].

^ result.
'.
	}