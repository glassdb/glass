*squeak
valueWithPossibleArgument: anArg 
     "Evaluate the block represented by the receiver. 
     If the block requires one argument, use anArg, if it requires more than one,
     fill up the rest with nils."
  | na arr |
  (na := self numArgs) == 0 ifTrue: [^self value].
  na == 1 ifTrue: [^self value: anArg].
  "na cannot be negative"
  arr := Array new: na .
  arr at: 1 put: anArg .
  ^self valueWithArguments: arr .