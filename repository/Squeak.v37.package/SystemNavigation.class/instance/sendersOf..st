private
sendersOf: aSelector
	"Returns an Array of GsMethods that send the given selector.  "

	^self sendersOf: aSelector in: self classOrganizer classes