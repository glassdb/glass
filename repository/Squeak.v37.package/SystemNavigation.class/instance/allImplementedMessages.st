query
allImplementedMessages
	"Answer a Set of all the messages that are implemented in the system."
	^ self allImplementedMessagesWithout: (Array with: Array new with: Array new)