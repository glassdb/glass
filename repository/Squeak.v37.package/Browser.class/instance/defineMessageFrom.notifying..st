message list
defineMessageFrom: aString notifying: aController 
  "Compile the expressions in aString. Notify
  aController if a syntax error occurs. Install the
  compiled method in the selected class classified
  under the currently selected message category
  name. Answer true if the compilation succeeds, 
  otherwise false."
  | selectedMessageName oldMessageList |
  selectedMessageName := self selectedMessageName.
  oldMessageList := self messageList.
  contents := nil.
  ^ [ self selectedClassOrMetaClass
        compile: aString
        classified: self selectedMessageCategoryName.
      true
    ] onException: CompileError do:[:ex | false ].