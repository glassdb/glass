private
dictionaryName

self systemCategoryListIndex = 0 ifTrue: [ ^nil ].
^(System myUserProfile symbolList asArray at: self systemCategoryListIndex) name