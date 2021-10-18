*squeak
findString: subString startingAt: anInteger
	"Answer the index of subString within the receiver, starting at anInteger . If 
	the receiver does not contain subString, answer 0."
	^ self _findString: subString startingAt: anInteger ignoreCase: false