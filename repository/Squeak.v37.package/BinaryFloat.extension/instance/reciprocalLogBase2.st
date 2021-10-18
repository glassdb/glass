*squeak-printing
reciprocalLogBase2
	"optimized for self = 10, for use in conversion for printing"
	^ self = 10.0
		ifTrue: [ 0.693147180559945 "Ln2" / 2.302585092994045 "Ln10"]
		ifFalse: [0.693147180559945 / self ln]