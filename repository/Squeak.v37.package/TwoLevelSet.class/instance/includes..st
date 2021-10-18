accessing
includes: aPoint

	^(firstLevel at: aPoint x ifAbsent: [^false]) includes: aPoint y