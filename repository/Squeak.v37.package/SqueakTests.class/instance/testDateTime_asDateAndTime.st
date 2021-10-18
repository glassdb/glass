testing
testDateTime_asDateAndTime
  | d1 d2 |
  d1 := (DateTime
    newWithYear: 1901
    dayOfYear: 1
    seconds: 0
    timeZone: (TimeZone named: 'GMT')) asDateAndTime.
  d2 := DateAndTime
    date: '01-01-1901' asDate
    time: '00:00:00' asTime
    offset: Duration zero.
  self assert: d1 = d2