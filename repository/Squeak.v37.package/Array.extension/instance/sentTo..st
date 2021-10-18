*squeak
sentTo: receiver
	"Message compatibility"

   ^ receiver perform: (self at: 1) withArguments: (self at: 2)