*squeak
atRandom
	"Answer a random element of the receiver.  Uses a shared random 
	number generator owned by class Collection.  If you use this a lot, 
	define your own instance of Random and use #atRandom:.  Causes 
	an error if self has no elements."

	^ Collection mutexForPicking critical: [
		self atRandom: Collection randomForPicking ]