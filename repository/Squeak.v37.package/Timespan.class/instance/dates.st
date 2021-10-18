enumerating
dates


	| dates |

	dates _ OrderedCollection new.

	self datesDo: [ :m | dates add: m ].
	^ dates asArray.