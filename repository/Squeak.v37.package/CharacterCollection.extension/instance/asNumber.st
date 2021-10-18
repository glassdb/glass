*squeak-converting
asNumber 
	"Answer the Number created by interpreting the receiver as the string 
	representation of a number."

	^Number readFrom: self readStream