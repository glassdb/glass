instance creation
with: firstArgAssoc with: secondArgAssoc
	| argList |
	argList _ self with: firstArgAssoc.
	argList add: secondArgAssoc key value: secondArgAssoc value.
	^argList