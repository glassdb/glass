deprecated
midnightOn: aDate
	"Answer a new instance that represents aDate at midnight."

	^ self 
		deprecated: 'Deprecated';
		date: aDate time: Time midnight