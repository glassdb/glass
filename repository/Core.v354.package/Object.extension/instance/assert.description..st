*core-squeak
assert: aBlock description: aString
	"Throw an assertion error if aBlock does not evaluates to true."

	aBlock value ifFalse: [AssertionFailure signal: aString ]