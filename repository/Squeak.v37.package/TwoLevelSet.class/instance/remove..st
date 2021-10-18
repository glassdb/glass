accessing
remove: aPoint

	| lev2 |

	lev2 := firstLevel at: aPoint x ifAbsent: [^self].
	lev2 remove: aPoint y ifAbsent: [].
	lev2 isEmpty ifTrue: [firstLevel removeKey: aPoint x].