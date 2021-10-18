*squeak
dayMonthYearDo: aBlock 
	"Supply integers for day, month and year to aBlock and return the result"

	^ aBlock value: self day value: self month value: self year