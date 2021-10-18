*squeak-converting
findSelector
	"Dan's code for hunting down selectors with keyword parts; while this doesn't give a true parse, in most cases it does what we want, in where it doesn't, we're none the worse for it."
	| sel possibleParens level n |
	sel _ self withBlanksTrimmed.
	(sel includes: $:) ifTrue:
		[sel _ sel copyReplaceAll: ':' with: ': '.	"for the style (aa max:bb) with no space"
		possibleParens _ sel findTokens: Character separators.
		sel _ self class streamContents:
			[:s | level _ 0.
			possibleParens do:
				[:token |
				(level = 0 and: [token endsWith: ':'])
					ifTrue: [s nextPutAll: token]
					ifFalse: [(n _ token occurrencesOf: $( ) > 0 ifTrue: [level _ level + n].
							(n _ token occurrencesOf: $[ ) > 0 ifTrue: [level _ level + n].
							(n _ token occurrencesOf: $] ) > 0 ifTrue: [level _ level - n].
							(n _ token occurrencesOf: $) ) > 0 ifTrue: [level _ level - n]]]]].

	sel isEmpty ifTrue: [^ nil].
	sel isOctetString ifTrue: [sel _ sel asOctetString].
	Symbol hasInterned: sel ifTrue:
		[:aSymbol | ^ aSymbol].
	^ nil