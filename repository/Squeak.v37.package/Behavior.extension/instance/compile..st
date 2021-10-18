*squeak
compile: methodText

	| selector cat |
	selector := Behavior parseSelector: methodText for: self.
	cat := ClassOrganizer default.
	selector ~~ nil
		ifTrue: [ | oldCat |
			oldCat := self categoryOfSelector: selector.
			oldCat ~~ nil ifTrue: [ cat := oldCat ]].
	^self compile: methodText classified: cat