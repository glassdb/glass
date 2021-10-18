handling
defaultAction
	Log ifNotNil: [ Log add: self].
	Transcript nextPutAll: self messageText; cr