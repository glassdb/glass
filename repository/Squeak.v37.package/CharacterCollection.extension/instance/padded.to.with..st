*squeak
padded: leftOrRight to: length with: char
	leftOrRight = #left ifTrue:
		[^ (self class new: (length - self size max: 0) withAll: char) , self].
	leftOrRight = #right ifTrue:
		[^ self , (self class new: (length - self size max: 0) withAll: char)].