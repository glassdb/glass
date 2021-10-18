private
newSendersOf: aSelector
	"Returns an Array of GsMethods that send the given selector.  "

	^self newSendersOf: aSelector in: self classOrganizer classes