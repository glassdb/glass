testing
testPageBoundaryQuadByteStringEncode
	"poke around the page boundary"
		
	| sample encoded pageSize |
	pageSize := SystemRepository pageSize.
	sample := self generateRandomString: pageSize / 4.
	pageSize := sample size.
	[	encoded := sample encodeAsUTF8.
		self assert: encoded decodeFromUTF8 = sample.
		encoded _isLarge] 
			whileTrue: [ 
				pageSize := pageSize - 1.
				sample := sample copyFrom: 1 to: pageSize ].
	5 timesRepeat: [
		pageSize := pageSize - 1.
		sample := sample copyFrom: 1 to: pageSize.
		encoded := sample encodeAsUTF8.
		self assert: encoded decodeFromUTF8 = sample].
