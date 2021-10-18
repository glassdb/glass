*squeak
mutexForPicking

	| mutex |
	mutex := SessionTemps current at: #COLLECTION_MUTEX_FOR_PICKING otherwise: nil.
	mutex == nil 
		ifTrue: [
			mutex := Semaphore forMutualExclusion.
			SessionTemps current at: #COLLECTION_MUTEX_FOR_PICKING put: mutex].
	^mutex