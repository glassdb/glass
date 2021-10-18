testing
testMultiByteTruncate
	| multiByteString |
	multiByteString := 'hello', (String with: (Character value: 8364)).
	
	self assert: 'hell' = (multiByteString truncateTo: 4).
	self assert: 'h...' = (multiByteString truncateWithElipsisTo: 4)