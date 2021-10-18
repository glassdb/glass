tests
testDefaultParserClassIsUsed
	"NumberParser class methods default to using a concrete default parser class"
	
	self assert: (NumberParser on: '123') class == NumberParser defaultParserClass.
	self assert: (NumberParser parse: '123') = 123.
	self assert: (NumberParser parse: '123' onError: [ nil ]) = 123.
