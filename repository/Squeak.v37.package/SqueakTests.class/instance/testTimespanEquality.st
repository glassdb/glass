testing
testTimespanEquality

	| starting duration |
	starting := DateAndTime today.
	duration := Duration weeks: 1.
	starting := (Week starting: starting duration: duration) start.
	self assert: (Timespan starting: starting duration: duration) = (Timespan starting: starting duration: duration).
	self assert: (Week starting: starting duration: duration) = (Week starting: starting duration: duration).
	self deny: (Timespan starting: starting duration: duration) = (Week starting: starting duration: duration).