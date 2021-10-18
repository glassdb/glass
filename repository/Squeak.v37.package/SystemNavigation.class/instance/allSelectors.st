query
allSelectors
	"Answer a Collection of all selectors for all classes in users symbol lists."

	| aCollection |
	aCollection _ IdentitySet new.
	self allBehaviorsDo: [:beh | 
		aCollection addAll: beh allSelectors].
	^ aCollection