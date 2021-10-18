*squeak
_matchPatternNoCase: aPattern

"Just like matchPattern: except the match is case-insensitive."

| match         "indicates if the current pattern matched"
  pattern       "the Array of pattern elements"
  selfSize      "the size of the receiver"
  patternSize   "the number of elements in the pattern Array"
  startIndexArr "an Array of indexes into the receiver; this Array is
                 parallel to the pattern Array (each element in this Array
                 corresponds to the starting index for each pattern element)"
  index         "index into the pattern Array and the startIndexArr Array"
  thisPattern   "the current element of the pattern to match"
  selfIndex     "an index into the receiver"
|

 "The pattern Array must be processed so that there are no *? pairs in it.
 They must all be converted to ?* pairs for the algorithm to work correctly."
 pattern:= Array withAll: aPattern.
 patternSize:= pattern size.
 index := 1.
 [ index < patternSize ]
 whileTrue:
 [ (((pattern at: index) isEquivalent: $* ) 
    _and:[ (pattern at: index+1) isEquivalent: $? ]) 
   ifTrue:[ 
     pattern at: index put: $?.
     pattern at: index+1 put: $*.
     index := 1 max: index-1.
   ]
   ifFalse:
   [ index := index + 1 ].
 ].

 "initialize"
 selfSize := self size.
 startIndexArr:= Array new: (patternSize + 1).
                 "last element is set, but not used"
 index := 1.
 startIndexArr at: 1 put: 1.

 "if no patterns to match, exit early"
 (patternSize == 0)
 ifTrue:
    [^ selfSize == 0 ].

 [index <= patternSize]
 whileTrue:
 [ thisPattern := pattern at: index.
   selfIndex := startIndexArr at: index.
   match := true.

   (thisPattern isKindOf: CharacterCollection) "pattern to match is a string"
   ifTrue:
   [ (selfIndex + thisPattern size - 1) > selfSize
     ifTrue: "this pattern too big to match rest of receiver"
        [^ false ].

     index = patternSize "processing the final pattern"
     ifTrue:
     [ ((index > 1) _and: [ (pattern at: index - 1) isEquivalent: $* ])
       ifTrue: "is not the first pattern _and_ previous pattern was a $*"
       [ ((selfSize == 0) _and: [thisPattern size == 0])
         ifTrue: [^ true].
         ^(self 
			_findString: thisPattern
               startingAt: selfSize - thisPattern size + 1
			ignoreCase: true) ~~ 0
         "find the pattern far enough back in the string so that only
         the final chars match"
       ]
       ifFalse: "processing first pattern _or_ previous pattern was not $*"
       [ (match:= (selfIndex + thisPattern size - 1 = selfSize))
         ifTrue: "exactly enough chars in self to match thisPattern"
         [ (selfSize == 0)
           ifTrue: [match:= (thisPattern size == 0)]
           ifFalse: [match:= self _at: selfIndex equals: thisPattern ignoreCase: true].
         ]
       ].
     ]
     ifFalse: "not processing the final pattern"
     [ ((index > 1) _and: [ (pattern at: index - 1) isEquivalent: $* ])
       ifTrue: "not first pattern _and_ previous pattern was $*"
       [ (((selfSize == 0) _and: [thisPattern size == 0]) _or:
         [(selfIndex:= self 
						_findString: thisPattern
                           	startingAt: selfIndex
						ignoreCase: true) > 0])
         ifTrue: "thisPattern was found"
         [ startIndexArr at: index put: selfIndex.
           startIndexArr at: index + 1 put: selfIndex + thisPattern size.
         ]
         ifFalse: "thisPattern was not found"
            [^ false ]
       ]
       ifFalse: "first pattern _or_ previous pattern was not $*"
       [ (((selfSize == 0) _and: [thisPattern size == 0]) _or:
         [(self _at: selfIndex equals: thisPattern ignoreCase: true)])
         ifTrue:
            [startIndexArr at: index + 1 put: selfIndex+ thisPattern size]
         ifFalse:
            [match := false ].
       ].
     ]
   ]
   ifFalse: "thisPattern is not a string"
   [ (thisPattern isEquivalent: $*)
     ifTrue:
        [startIndexArr at: (index + 1) put: selfIndex]
     ifFalse:
     [ (thisPattern isEquivalent: $?)
       ifTrue:
       [ selfIndex > selfSize
         ifTrue: "no char to match; already at end of self"
            [^ false ].
         startIndexArr at: (index + 1) put: (selfIndex + 1).
         index = patternSize "processing the last pattern"
         ifTrue:
            [match := selfIndex = selfSize.].
       ]
       ifFalse: "next pattern is neither a $* or $?"
       [ ^ aPattern _error: #rtErrBadPattern].
     ].
   ].  "end ifTrue:ifFalse"

   match
   ifTrue:
      [index := index + 1 ] "advance to the next term in the pattern"
   ifFalse:
   [ "If there is a preceding $* term in the pattern, backup to the
      term following it, and advance position in the string by 1."
      [ index := index - 1.
        index < 2 ifTrue:
           [^ false ].
        (pattern at: index - 1) isEquivalent: $*
      ] untilTrue.
      startIndexArr at: index put: ((startIndexArr at: index) + 1).
   ].
].  "end whileTrue:"

^ true