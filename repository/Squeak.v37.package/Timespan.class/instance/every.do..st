enumerating
every: aDuration do: aBlock

	| element end |

	element _ self start.

	end _ self end.

	[ element <= end ] whileTrue:
	
	[ aBlock value: element.

		element _ element + aDuration. ]