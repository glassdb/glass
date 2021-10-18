*squeak
changeFromCategorySpecs: categorySpecs 
  "Tokens is an array of categorySpecs as scanned from a browser 'reorganize' pane, or built up by some other process, such as a scan of an environment."

  self _validatePrivilege.
  1 to: categorySpecs size do: 
    [:i | | catSpec newCat selectors catDict |
    catSpec _ categorySpecs at: i.
    newCat := catSpec first asSymbol.
    selectors := catSpec allButFirst collect: [:each |
      each isSymbol
        ifTrue: [ each ]
        ifFalse: [ each asSymbol ]
    ].
    (self includesCategory: newCat) ifFalse: [ self addCategory: newCat ].
    catDict := self _categories.
    selectors do: [:sel | | oldCat setOfSelectors |
      oldCat := self categoryOfSelector: sel.
      setOfSelectors := catDict at: oldCat.
      setOfSelectors remove: sel ifAbsent: [].
      setOfSelectors := catDict at: newCat.
      setOfSelectors add: sel
    ].
  ].