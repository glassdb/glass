creating patches
buildReferenceMap
	dstLines doWithIndex:[:line :index|
		(srcPos at: line ifAbsent:[#()]) 
			do:[:index2| matches at: index@index2 put: line]
	].
	srcLines doWithIndex:[:line :index|
		(dstPos at: line ifAbsent:[#()]) 
			do:[:index2| matches at: index2@index put: line]
	].