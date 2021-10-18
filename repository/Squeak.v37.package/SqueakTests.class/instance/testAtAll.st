testing
testAtAll

	self assert: (#('one' 'two' 'three' 'four') atAll: #(3 2 4)) = #('three' 'two' 'four')