*squeak
isAllSeparators
  "whether the receiver is composed entirely of separators"
  1 to: self size do: [ :j | (self at:j) isSeparator ifFalse: [ ^false ] ].
  ^true