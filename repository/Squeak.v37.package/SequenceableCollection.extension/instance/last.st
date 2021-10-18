*squeak-accessing
last
    "Answer the last element of the receiver.
    Raise an error if the collection is empty."

    | sz |
    (sz := self size) == 0 ifTrue: [self errorEmptyCollection].
    ^ self at: sz