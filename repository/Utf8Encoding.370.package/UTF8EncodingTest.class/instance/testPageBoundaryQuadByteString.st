testing
testPageBoundaryQuadByteString
	"poke around the page boundary"
		
	| sample pageSize |
	pageSize := SystemRepository pageSize.
	sample := self generateRandomString: pageSize / 4.
	self assert: sample class == Unicode32.
	pageSize := sample size.
	[	self primEncodePrimDecode: sample.
		sample _isLarge] 
			whileTrue: [ 
				pageSize := pageSize - 1.
				sample := sample copyFrom: 1 to: pageSize ].
	5 timesRepeat: [
		pageSize := pageSize - 1.
		sample := sample copyFrom: 1 to: pageSize.
		self deny: sample _isLarge.
		self primEncodePrimDecode: sample].
