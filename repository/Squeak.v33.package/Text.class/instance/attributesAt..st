emphasis
attributesAt: characterIndex 
	"Answer the code for characters in the run beginning at characterIndex."
	"NB: no senders any more (supplanted by #attributesAt:forStyle: but
	retained for the moment in order not to break user code that may exist
	somewhere that still calls this"
	| attributes |
	"null text tolerates access"
	attributes := runs at: characterIndex.
	^ attributes