*squeak
stemAndNumericSuffix
	"Parse the receiver into a string-valued stem and a numeric-valued suffix.  6/7/96 sw"

	| stem suffix position |

	stem _ self.
	suffix _ 0.
	position _ 1.
	[stem endsWithDigit and: [stem size > 1]] whileTrue:
		[suffix _  stem last digitValue * position + suffix.
		position _ position * 10.
		stem _ stem copyFrom: 1 to: stem size - 1].
	^ Array with: stem with: suffix

"'Fred2305' stemAndNumericSuffix"