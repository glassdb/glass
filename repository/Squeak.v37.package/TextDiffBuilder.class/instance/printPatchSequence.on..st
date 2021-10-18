printing
printPatchSequence: seq on: aStream 
	seq do: 
		[:assoc | 
		aStream
			withAttributes: (self attributesOf: assoc key)
			do: [aStream nextPutAll: assoc value; cr]]