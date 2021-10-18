private
_listClassesIn: aDict

| aSet sortedNames |
(aDict isKindOf: SymbolDictionary) ifFalse:[ ^ false ].
aSet := SymbolSet new .
aDict associationsDo:[:assoc |
  (assoc value isKindOf:Class) ifTrue:[ aSet add: assoc key ]. 
  ].
sortedNames := aSet sortAscending:'' .
^sortedNames asArray