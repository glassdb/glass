creating patches
processDiagonalsFrom: todoList
	| runList start run todo |
	todo := todoList copy.
	runList := PluggableDictionary new.
	runList hashBlock: self pointHashBlock.
	runList equalBlock: self pointEqualBlock.
	[todo isEmpty] whileFalse:[
		start := todo detect:[:any| true].
		run := OrderedCollection new.
		start := self 
					collectRunFrom: todo 
					startingWith: start 
					into: run.
		runList at: start put: run.
	].
	"If we have multiple matches we might have chosen a bad sequence.
	There we redo the whole thing recursively"
	self hasMultipleMatches  ifFalse:[^runList].
	runList size < 2 ifTrue:[^runList].

	run := nil.
	start := 0.
	runList associationsDo:[:assoc|
		(run isNil or:[assoc value size > run size]) ifTrue:[
			run := assoc value.
			start := assoc key]].
	"Now found the longest run"
	run := OrderedCollection new.
	start := self
				collectRunFrom: todoList
				startingWith: start
				into: run.
	"Find the diagonals in the remaining set"
	runList := self processDiagonalsFrom: todoList.
	runList at: start put: run.
	^runList