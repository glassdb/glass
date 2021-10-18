testing
testIfEmpty
	| coll |
	self
		assert:
			(#()
				ifEmpty: [ 
					self assert: true.
					'empty' ]) = 'empty'.
	coll := {1. 2. 3}.
	self assert: (coll ifEmpty: [ self assert: false ]) = coll