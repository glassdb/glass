*squeak
humanWordsForSecondsAgo: secs
  | date days |
  "Return natural language for this date and time in the past."

  secs <= 1 ifTrue: [^ 'a second ago'].
  secs < 45 ifTrue: [^ secs printString, ' seconds ago'].
  secs < 90 ifTrue: [^ 'a minute ago'].
  secs < "45*60" 2700 ifTrue: [^ (secs//60) printString, ' minutes ago'].
  secs < "90*60" 5400 ifTrue: [^ 'an hour ago'].
  secs < "18*60*60" 64800 ifTrue: [^ (secs//3600) printString, ' hours ago'].
  days := (Duration seconds: secs) days.
  date := DateTime now subtractSeconds: secs.    "now work with dates"
  days < 2 ifTrue: [ ^ 'yesterday'].
  days < 8 ifTrue: [^ 'last ', date weekDayName].
  days < 13 ifTrue: [^ 'a week ago'].
  days < 28 ifTrue: [ ^ (days //7) printString, ' weeks ago'].
  days < 45 ifTrue: [^ 'a month ago'].
  days < 300 ifTrue: [^ 'last ', date monthName].
  ^ date monthName, ', ', date year printString

"Example
#(0.5 30 62 130 4000 10000 60000 90000 345600 864000 1728000 3456000 17280000 34560000 345600000) 
    collect: [:ss | Time humanWordsForSecondsAgo: ss].
"