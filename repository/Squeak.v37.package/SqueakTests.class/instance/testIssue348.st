testing
testIssue348
	"http://code.google.com/p/glassdb/issues/detail?id=248"

	self should: [#() copyFrom: 1 to: 0 into: (ByteArray new: 1) startingAt: 1 ] raise: ImproperOperation