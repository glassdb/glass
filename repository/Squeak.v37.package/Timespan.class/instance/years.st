enumerating
years


	| years |

	years _ OrderedCollection new.

	self yearsDo: [ :m | years add: m ].

	^ years asArray.