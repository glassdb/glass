instance creation
generateFieldsVersion4

	semaphoreForGenerator critical: 
			[bits1 := random integer.
			bits2 := random integer.
			bits3 := random integer.
			bits4 := random integer].
	bits2 := (bits2 bitAnd: 16rFFFF0FFF) bitOr: 16r4000.
	bits3 := (bits3 bitAnd: 16r3FFFFFFF) bitOr: 16r80000000