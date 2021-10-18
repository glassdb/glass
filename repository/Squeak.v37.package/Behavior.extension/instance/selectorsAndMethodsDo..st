*squeak
selectorsAndMethodsDo: aBlock
  "Evaluate selectorBlock for all the message selectors in my method dictionary."

  ^ (self methodDictForEnv:0) keysAndValuesDo: aBlock