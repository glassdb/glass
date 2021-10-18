system category list
selectCategoryForClass: theClass
| categoryName |
categoryName := ((System myUserProfile dictionaryAndSymbolOf: theClass) at: 1) name.
self systemCategoryListIndex: (self systemCategoryList indexOf: categoryName)