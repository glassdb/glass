private
split: aString by: splitChar
	| lines index nextIndex |
	lines := OrderedCollection new.
	index := 1.
	[index <= aString size] whileTrue:[
		nextIndex := aString 
						indexOf: splitChar 
						startingAt: index 
						ifAbsent:[aString size+1].
		lines add: (aString copyFrom: index to: nextIndex-1).
		index := nextIndex+1].
	^lines