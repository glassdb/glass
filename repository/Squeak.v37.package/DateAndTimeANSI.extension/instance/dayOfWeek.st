*squeak
dayOfWeek
	"Synopsis
	Answer the number of the day in the week, in the local time of the receiver, which includes the
	receiver.
	Definition: <DateAndTime>
	Answer an <integer> between 1 and 7 inclusive representing the number of the day in the week, in
	the local time of the receiver, which includes the receiver. Sunday is 1, Monday is 2, and so on.
	Return Values
	<integer>unspecified"

	^self asSeconds + self _offsetSeconds // 60 // 60 // 24 + 1 \\ 7 + 1  "1 January 2001 was a Monday"