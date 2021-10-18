*squeak-accessing
atAllPut: anObject

"Assigns anObject to each of the receiver's elements. Squeak override of base behavior"

1 to: self size do: [ :index | self at: index put: anObject].