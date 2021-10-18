initialize
destString: aString 
	realDst := self split: aString asString.
	dstLines := OrderedCollection new.
	dstMap := OrderedCollection new.
	realDst
		doWithIndex: [:line :realIndex | 
			dstLines
				add: (self formatLine: line).
			dstMap add: realIndex].
	dstPos := PluggableDictionary new: dstLines size.
	dstPos hashBlock: self stringHashBlock.
	dstLines
		doWithIndex: [:line :index | (dstPos includesKey: line)
				ifTrue: [(dstPos at: line)
						add: index.
					multipleMatches := true]
				ifFalse: [dstPos
						at: line
						put: (OrderedCollection with: index)]]