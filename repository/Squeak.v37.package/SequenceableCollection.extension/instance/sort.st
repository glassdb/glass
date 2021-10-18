*squeak-sorting
sort
	"Sort this array into ascending order using the '<=' operator."

	^self sort: [:a :b | a <= b]