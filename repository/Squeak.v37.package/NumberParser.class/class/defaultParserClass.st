instance creation
defaultParserClass
  DefaultParserClass
    ifNil: [ 
      "avoid potential conflicts due to lazy initialization ... just answer default class"
      ^ SqNumberParser ].
  ^ DefaultParserClass