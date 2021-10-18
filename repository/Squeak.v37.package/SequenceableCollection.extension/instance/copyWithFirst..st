*squeak-copying
copyWithFirst: newElement 
  "Answer a copy of the receiver that is 1 bigger than the receiver with newElement as the first element."

  | newIC mySize |
  newIC _ self species ofSize: (mySize :=self size) + 1.
  newIC 
    replaceFrom: 2
    to: mySize + 1
    with: self
    startingAt: 1.
  newIC at: 1 put: newElement.
  ^ newIC