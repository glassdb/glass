*squeak-accessing
atAll: indexArray
  "Answer a new collection like the receiver which contains all elements
  of the receiver at the indices of indexArray."
  "#('one' 'two' 'three' 'four') atAll: #(3 2 4)"

  | newCollection idxaSize |
  newCollection _ self species ofSize: (idxaSize := indexArray size).
  1 to: idxaSize do:
    [:index |
    newCollection at: index put: (self at: (indexArray at: index))].
  ^ newCollection