squeak protocol
intersection: aTimespan

	 "Return the Timespan both have in common, or nil"

	 | aBegin anEnd |

	 aBegin _ self start max: aTimespan start.

	 anEnd _ self end min: aTimespan end.

	 anEnd < aBegin ifTrue: [^nil].


	 ^ self class starting: aBegin ending: anEnd.