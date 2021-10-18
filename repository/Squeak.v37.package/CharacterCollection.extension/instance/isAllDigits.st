*squeak
isAllDigits
	"whether the receiver is composed entirely of digits"
	1 to: self size do: [:j | (self at: j) isDigit ifFalse: [^ false]].
	^ true