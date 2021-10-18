*squeak
compile: methodText classified: cat withStamp: aStamp notifying: ignored logSource: ignored2
  "Returns nil, or signals an Error with compilation error details"

  | errorString sel |
  [ 
  self
    compileMethod: methodText
    category: cat
    using: GsSession currentSession symbolList ]
    onException: CompileError
    do: [ :ex | 
      errorString := GsNMethod
        _sourceWithErrors: ex errorDetails
        fromString: methodText ].
  errorString ifNotNil: [ ^ self error: errorString ].
  sel := Behavior parseSelector: methodText for: self.
  self setStamp: aStamp forMethod: sel.
  ^ nil