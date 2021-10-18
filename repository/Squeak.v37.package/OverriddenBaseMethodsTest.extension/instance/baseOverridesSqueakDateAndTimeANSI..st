*squeak
baseOverridesSqueakDateAndTimeANSI: known
	self
		addTo: known
		forBehavior: DateAndTimeANSI
		overrides: {
			#'print:on:' -> 'print: anArray on: aStream 

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
	x \\ 1 = 0 ifTrue: [
		x < 10 ifTrue: [aStream nextPut: $0].
		x rounded printOn: aStream.
	] ifFalse: [	"See bugs 36718, 40624, and 40643"
		| string i |
		"Adding 100 causes a very tiny loss of precission but makes parsing much easier"
		string := (x + 100) asFloat asStringLocaleC.	
		(string at: 2) = $. ifFalse: [self error: ''unexpected format''].
		(string copyFrom: string size - 3 to: string size) = ''E+02'' ifFalse: [self error: ''unexpected format''].
		i := string size - 4.
		[
			(string at: i) = $0.
		] whileTrue: [
			i := i - 1.
		].
		aStream
			nextPut: (string at: 3);
			nextPut: (string at: 4);
			nextPut: $.;
			nextPutAll: (string copyFrom: 5 to: i).
	].
	self offset printOnHoursMinutes: aStream.
'.
	}