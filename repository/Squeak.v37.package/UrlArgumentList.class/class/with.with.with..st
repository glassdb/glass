instance creation
with: firstArgAssoc with: secondArgAssoc with: thirdArgAssoc
	| argList |
	argList _ self with: firstArgAssoc with: secondArgAssoc.
	argList add: thirdArgAssoc key value: thirdArgAssoc value.
	^argList