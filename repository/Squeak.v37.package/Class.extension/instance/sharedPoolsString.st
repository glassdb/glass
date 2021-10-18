*squeak
sharedPoolsString
	"Answer a string of my shared pool names separated by spaces."

	^String streamContents: [ :stream |
		self poolDictionaryNames
			do: [ :each | stream nextPutAll: each ]
			separatedBy: [ stream space ] ]