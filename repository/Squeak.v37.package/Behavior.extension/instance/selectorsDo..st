*squeak
selectorsDo: aBlock
	"Evaluate selectorBlock for all the message selectors in my method dictionary."

	^ (self methodDictForEnv: 0) keysDo: aBlock