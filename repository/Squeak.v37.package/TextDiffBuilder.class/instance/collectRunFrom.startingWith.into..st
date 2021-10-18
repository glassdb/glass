creating patches
collectRunFrom: todo startingWith: startIndex into: run
	| next start |
	start := startIndex.
	self remove: start from: todo.
	run add: (matches at: start).
	"Search downwards"
	next := start.
	[next := next + (1@1).
	todo includes: next] whileTrue:[
		run addLast: (matches at: next).
		self remove: next from: todo].
	"Search upwards"
	next := start.
	[next := next - (1@1).
	todo includes: next] whileTrue:[
		run addFirst: (matches at: next).
		self remove: next from: todo.
		start := next. "To use the first index"
	].
	^start