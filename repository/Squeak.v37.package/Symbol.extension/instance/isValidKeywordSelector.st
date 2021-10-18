*squeak-testing
isValidKeywordSelector
	self isEmpty ifTrue: [^false].
	self last == $: ifFalse: [^false].
	(self findTokens: ':') do: [:substring | substring isValidIdentifier ifFalse: [^false]].
	^true