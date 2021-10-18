*squeak
randomForPicking

	| random |
	random := SessionTemps current at: #COLLECTION_RANDOM_FOR_PICKING otherwise: nil.
	random == nil 
		ifTrue: [
			random := Random new.
			SessionTemps current at: #COLLECTION_RANDOM_FOR_PICKING put: random].
	^random