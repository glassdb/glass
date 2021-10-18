*squeak
asDate
  | parts m d y |
  parts := self asParts.
  y := parts at: 1.
  m := parts at: 3.
  d := parts at: 4.
  ^ Date newDay: d monthNumber: m year: y