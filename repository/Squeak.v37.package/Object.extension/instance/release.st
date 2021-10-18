*squeak
release
	"Remove references to objects that may refer to the receiver. This message 
	should be overridden by subclasses with any cycles, in which case the 
	subclass should also include the expression super release."

	"Added to GemStone so super methods will not fail (e.g., WARenderContext>>#'release'."