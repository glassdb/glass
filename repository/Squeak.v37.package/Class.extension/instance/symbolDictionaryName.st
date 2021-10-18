*squeak
symbolDictionaryName

	| anArray |
	anArray := System myUserProfile dictionaryAndSymbolOf: self.
	anArray == nil 
		ifTrue: [ ^ '(class not in your dictionaries)' ]
		ifFalse: [
  			anArray := System myUserProfile dictionaryAndSymbolOf: (anArray at: 1).
  			anArray == nil 
				ifTrue: [ ^ '(dictionary not in your dictionaries)' ]
  				ifFalse: [ ^(anArray at: 2) ]
		].