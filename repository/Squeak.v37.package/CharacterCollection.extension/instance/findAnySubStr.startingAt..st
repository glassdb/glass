*squeak
findAnySubStr: delimiters startingAt: start
	| min ind |
	min := self size + 1.
	delimiters do:
			[:delim |
			delim isCharacter
				ifTrue:
					[ind := self
								indexOfSubCollection: (String with: delim)
								startingAt: start
								ifAbsent: [min]]
				ifFalse:
					[ind := self
								indexOfSubCollection: delim
								startingAt: start
								ifAbsent: [min]].
			min := min min: ind].
	^ min