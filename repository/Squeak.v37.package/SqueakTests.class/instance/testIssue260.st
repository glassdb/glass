testing
testIssue260
	"http://code.google.com/p/glassdb/issues/detail?id=260"

	| list |
	list := #(#a #b #c #d).
	self assert: list = (list asSortedCollection sort: [ :a :b | a <= b ]).
	self assert: list = (list asSortedCollection sortBy: [ :a :b | a <= b ])