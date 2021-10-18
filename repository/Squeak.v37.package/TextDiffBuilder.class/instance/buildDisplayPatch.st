creating patches
buildDisplayPatch
	^Text streamContents:[:stream|
		self printPatchSequence: self buildPatchSequence on: stream.
	]