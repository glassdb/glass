accessing
removeAllXAndY: aPoint

	| deletes |

	deletes := OrderedCollection new.
	firstLevel removeKey: aPoint x ifAbsent: [].
	firstLevel keysAndValuesDo: [ :x :lev2 |
		lev2 remove: aPoint y ifAbsent: [].
		lev2 isEmpty ifTrue: [deletes add: x].
	].
	deletes do: [ :each | firstLevel removeKey: each ifAbsent: []].