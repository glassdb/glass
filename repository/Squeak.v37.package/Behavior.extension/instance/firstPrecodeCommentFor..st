*squeak
firstPrecodeCommentFor: selector 
  "If there is a comment in the source code at the given selector that preceeds the body of the method, return it here, else return nil"
  "Behavior firstPrecodeCommentFor: #firstPrecodeCommentFor:"
  
  | i sz sourceString meth commentStart |
  i := 0.
  meth := self compiledMethodAt: selector ifAbsent: [ ^nil ].
  sourceString := meth sourceString.
  sz := sourceString size.
  (selector occurrencesOf: $:) timesRepeat: [
        i := sourceString indexOf: $: startingAt: i + 1 ].
  " check if it's a binary selector (it has an argument but no colons) "
  (i == 0 and: [ meth numArgs == 1 ])
      ifTrue: [ i := selector size ].
  " i is the offset of the last colon in the signature, or the last character
   of a binary selector, or zero "
  i := i + 1.

  " scan past any white space "
  [ (sourceString at: i) isSeparator ] whileTrue: [ i := i + 1 ].

  " scan past any non-white space to get to end of argument to last keyword"
  [ i <= sz and: [ (sourceString at: i) isSeparator not ]] whileTrue: [ i := i + 1 ].
  " i is now the offset of the first white space past the signature "

  " scan past any white space "
  [ i <= sz and: [ (sourceString at: i) isSeparator ] ] whileTrue: [ i := i + 1 ].
  " i is now the offset of the initial comment or first line of code "
  i > sz ifTrue: [ ^ nil ].
  commentStart := i.

  " if i is the offset of the initial comment, jump to the end of the comment "
  (sourceString at: i) == $"
      ifTrue: [ i := sourceString indexOf: $" startingAt: i + 1 ]
      ifFalse: [ i := i - 1 ].

  " create the string to replace the original source with "
  ^sourceString copyFrom: commentStart to: i