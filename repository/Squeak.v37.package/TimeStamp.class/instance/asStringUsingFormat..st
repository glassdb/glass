formatting
asStringUsingFormat: anArray
  "Returns a String that expresses the receiver in the format defined by anArray.
 Generates an error if anArray contains an incorrect formatting specification.

 See the class documentation of Date for a complete description of the
 String-formatting specification Array."

  | strm |
  strm := WriteStream on: String new.
  strm
    nextPutAll: (self date asStringUsingFormat: anArray);
    space;
    nextPutAll: self time printString.
  ^ strm contents