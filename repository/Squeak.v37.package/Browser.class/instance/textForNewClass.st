*squeak-private
textForNewClass
    "Show the class creation template"

    | inDictName |
    inDictName := self dictionaryName.
    inDictName isNil ifTrue: [ inDictName := 'UserGlobals' ].
    ^'NameOfSuperclass subclass: ''NameOfClass''
         instVarNames: #(''instVarName1'' ''instVarName2'')
         classVars: #(''ClassVarName1'' ''ClassVarName2'')
         classInstVars: #( ''ClassInstVarName1'' ''ClassInstVarName2'' )
         poolDictionaries: #()
         inDictionary: ', inDictName, '
         options: #() '