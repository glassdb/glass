accessing
at: aPoint put: anObject

	(firstLevel at: aPoint x ifAbsentPut: [Dictionary new]) at: aPoint y put: anObject