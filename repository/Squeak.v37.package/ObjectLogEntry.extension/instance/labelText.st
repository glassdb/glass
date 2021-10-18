*squeak
labelText

	^self priority == 1
		ifTrue: [ Text string: self labelString attribute: TextColor red ]
		ifFalse: [ self labelString ]