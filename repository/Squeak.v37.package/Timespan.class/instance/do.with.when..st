private
do: aBlock with: aFirstElement when: aConditionBlock

	| element end |
	element _ aFirstElement.
	end _ self end.

	[ element start <= end ] whileTrue:
	
	[(aConditionBlock value: element)
			ifTrue: [ aBlock value: element ].
		element _ element next. ]