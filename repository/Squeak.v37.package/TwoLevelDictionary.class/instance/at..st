accessing
at: aPoint

	^(firstLevel at: aPoint x ifAbsent: [^nil]) at: aPoint y ifAbsent: [^nil]