*squeak
date: aDate time: aTime offset: anOffset

	^ self 
		year: aDate year 
		day: aDate dayOfYear 
		hour: aTime hours
		minute: aTime minutes
		second: aTime seconds
		offset: anOffset