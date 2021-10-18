*squeak
midnight
	"Answer a DateAndTime starting at midnight local time"
	^ self
		dayMonthYearDo: [ :d :m :y | self class year: y month: m day: d ]