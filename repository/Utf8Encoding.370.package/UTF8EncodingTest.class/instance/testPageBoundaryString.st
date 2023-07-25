testing
testPageBoundaryString
	"poke around the page boundary"
		
	| sample pageSize |
	pageSize := SystemRepository pageSize.
	sample := self generateRandomSingleByteString: pageSize.
	self assert: sample class == String.
	[	self primEncodePrimDecode: sample.
		sample _isLarge] 
			whileTrue: [ 
				pageSize := pageSize - 1.
				sample := sample copyFrom: 1 to: pageSize ].
	5 timesRepeat: [
		pageSize := pageSize - 1.
		sample := sample copyFrom: 1 to: pageSize.
		self primEncodePrimDecode: sample].
