*squeak
print: anArray on: aStream 

	| x |
	x := anArray at: 1.
	x < 0 ifTrue: [aStream nextPut: $-].
	(x := x abs) < 1000 ifTrue: [aStream nextPut: $0].
	x < 100 ifTrue: [aStream nextPut: $0].
	x < 10 ifTrue: [aStream nextPut: $0].
	x printOn: aStream.
	aStream nextPut: $-.
	(x := anArray at: 3) < 10 ifTrue: [aStream nextPut: $0].
	x printOn: aStream.
	aStream nextPut: $-.
	(x := anArray at: 4) < 10 ifTrue: [aStream nextPut: $0].
	x printOn: aStream.
	aStream nextPut: $T.
	(x := anArray at: 5) < 10 ifTrue: [aStream nextPut: $0].
	x printOn: aStream.
	aStream nextPut: $:.
	(x := anArray at: 6) < 10 ifTrue: [aStream nextPut: $0].
	x printOn: aStream.
	aStream nextPut: $:.
	x := anArray at: 7.
	x  _printAsDateAndTimeANSISecondsOn: aStream.
	self offset printOnHoursMinutes: aStream.