Hashing
hashFunction: aKey

	^hashBlock == nil
		ifTrue: [ super hashFunction: aKey ]
		ifFalse: [ ((hashBlock value: aKey) \\  self tableSize) + 1 ]