accessing
twoLevelKeys

	| twoLevelSet |

	twoLevelSet := TwoLevelSet new.
	self keysDo: [ :each | twoLevelSet add: each].
	^twoLevelSet