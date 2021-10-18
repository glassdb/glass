*squeak-testing
isValidSelector
	^self isInfix or: [self isValidKeywordSelector or: [self isValidIdentifier]]