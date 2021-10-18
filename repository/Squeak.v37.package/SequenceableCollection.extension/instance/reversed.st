*squeak-converting
reversed
	"Answer a copy of the receiver with element order reversed."
	"Example: 'frog' reversed"

	| n result src |
	n _ self size.
	result _ self species new: n.
	src _ n + 1.
	1 to: n do: [:i | result at: i put: (self at: (src _ src - 1))].
	^ result