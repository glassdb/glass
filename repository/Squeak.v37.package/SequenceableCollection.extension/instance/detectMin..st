*squeak-enumerating
detectMin: aBlock
	"Evaluate aBlock with each of the receiver's elements as the argument. 
	Answer the element for which aBlock evaluates to the lowest number.
	If collection empty, return nil."

	| minElement minValue val |
	1 to: self size do: [:i | | each | 
		each := self at: i.
		minValue == nil
			ifFalse: [
				(val _ aBlock value: each) < minValue ifTrue: [
					minElement _ each.
					minValue _ val]]
			ifTrue: ["first element"
				minElement _ each.
				minValue _ aBlock value: each].
				"Note that there is no way to get the first element that works 
				for all kinds of Collections.  Must test every one."].
	^ minElement