*squeak
findLastOccuranceOfString: subString startingAt: start 
	"Answer the index of the last occurance of subString within the receiver, starting at start. If the receiver does not contain subString, answer 0.
Modified to used GEMSTONES: _findSmallString: subString startingAt: startIndex ignoreCase: aBoolean"
	| last now |
	last := self _findString: subString startingAt: start ignoreCase: true.
	last = 0 ifTrue: [^ 0].
	[last > 0] whileTrue: [
		now := last.
		(last + subString size) > self size ifTrue: [ ^now ].
		last := self _findString: subString startingAt: last + 1 ignoreCase: true.
	].

	^ now.