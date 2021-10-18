*squeak
templateForSubclassOf: priorClassName category: systemCategoryName 
    "Answer an expression that can be edited and evaluated in order 
    to define a new class, given that the class previously looked at was as given"

  | aClass anArray dictionaryName str |
  aClass := System myUserProfile symbolList objectNamed: priorClassName asString asSymbol.
  anArray := System myUserProfile dictionaryAndSymbolOf: aClass.
  dictionaryName :=  (anArray == nil or: [ (anArray at: 1) == GsPackagePolicy current homeSymbolDict])
      ifTrue: [ '' ]
      ifFalse: [
    anArray := System myUserProfile dictionaryAndSymbolOf: (anArray at: 1).
    (anArray == nil or: [(anArray at: 2) == #Globals])
        ifTrue: [ '' ]
        ifFalse: [ (anArray at: 2) asString ]
      ].
  (str := priorClassName asString) add: ' subclass: ''NameOfSubclass''' ; lf .
  aClass isBytes ifFalse:[ str add: '    instVarNames: #()'; lf ].
  str add:'    classVars: #()
    classInstVars: #()
    poolDictionaries: #()
    inDictionary: '; add: dictionaryName printString; add:'
    category: '''; add: systemCategoryName asString; add: $' ; add: '
    options: #() ' .
  ^ str