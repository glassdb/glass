parsing-large int
nextElementaryLargeIntegerBase: aRadix
	"Form an unsigned integer with incoming digits from sourceStream.
	Return this integer, or zero if no digits found.
	Stop reading if end of digits or if a LargeInteger is formed.
	Count the number of digits and the position of lastNonZero digit and store them in instVar"

	| value digit |
	value := 0.
	nDigits := 0.
	lastNonZero := 0.
	aRadix <= 10
		ifTrue: ["Avoid using digitValue which is awfully slow"
			[value isLarge or: [sourceStream atEnd
				or: [digit := sourceStream next charCode - 48.
					(0 > digit
							or: [digit >= aRadix])
						and: [sourceStream skip: -1.
							true]]]]
				whileFalse: [nDigits := nDigits + 1.
					0 = digit
						ifFalse: [lastNonZero := nDigits].
					value := value * aRadix + digit]]
		ifFalse: [
			[value isLarge or: [sourceStream atEnd
				or: [digit := sourceStream next digitValue.
					(0 > digit
							or: [digit >= aRadix])
						and: [sourceStream skip: -1.
							true]]]]
				whileFalse: [nDigits := nDigits + 1.
					0 = digit
						ifFalse: [lastNonZero := nDigits].
					value := value * aRadix + digit]].
	^value