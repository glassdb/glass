accessing
add: aPoint

	(firstLevel at: aPoint x ifAbsentPut: [Set new]) add: aPoint y