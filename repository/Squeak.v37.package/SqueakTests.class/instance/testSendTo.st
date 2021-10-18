testing
testSendTo

	self assert: ([ 1 myMessage ] on: MessageNotUnderstood do: [:ex | ex message sendTo: self ]).