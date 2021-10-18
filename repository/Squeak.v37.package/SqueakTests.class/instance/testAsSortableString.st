testing
testAsSortableString

	self assert: (DateAndTime fromString:  '2010-02-26T11:57:49-08:00') asSortableString =  '2010-02-26_11-57-49'