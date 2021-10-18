*squeak
dayMonthYearDo: aBlock
  "Evaluation the block with three arguments: day month, year."

  | parts |
  parts := self asParts.
  ^ aBlock
    value: (parts at: 4)
    value: (parts at: 3)
    value: (parts at: 1).