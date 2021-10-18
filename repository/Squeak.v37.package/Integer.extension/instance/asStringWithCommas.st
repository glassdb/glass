*squeak
asStringWithCommas
  "123456789 asStringWithCommas"
  "-123456789 asStringWithCommas"
  | digits digitsSiz |
  digits := self abs printString.
  ^ String streamContents:
    [:strm | 
    self sign = -1 ifTrue: [strm nextPut: $-].
    1 to: (digitsSiz := digits size) do: 
      [:i | strm nextPut: (digits at: i).
      (i < digitsSiz and: [(i - digitsSiz) \\ 3 = 0])
        ifTrue: [strm nextPut: $,]]]