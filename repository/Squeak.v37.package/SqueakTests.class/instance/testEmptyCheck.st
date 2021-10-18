testing
testEmptyCheck

	self should: [ #() emptyCheck ] raise: Error description: 'this collection is empty'.
	self shouldnt: [ {1. 2. 3} emptyCheck ] raise: Error description: 'this collection is empty'.