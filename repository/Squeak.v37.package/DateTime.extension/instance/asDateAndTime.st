*squeak
asDateAndTime
  ^ DateAndTime
    year: self yearGmt
    month: self monthGmt
    day: self dayGmt
    hour: self hourGmt
    minute: self minuteGmt
    second: self secondsGmt
    offset: Duration zero