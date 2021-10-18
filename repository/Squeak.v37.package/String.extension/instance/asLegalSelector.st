*squeak-converting
asLegalSelector
	| toUse |
	toUse := ''.
	self do:
		[:char | char isAlphaNumeric ifTrue: [toUse := toUse copyWith: char]].
	(self size == 0 or: [self first isLetter not])
		ifTrue:		[toUse := 'v', toUse].

	^ toUse withFirstCharacterDownshifted

"'234znak 43 ) 2' asLegalSelector"