*squeak
equalsNoCase: aCharCollection
"Returns true if the receiver is equivalent to aCharCollection.  The receiver
 is equivalent to aCharCollection if the receiver contains the same Characters
 as aCharCollection regardless of case or internal representation.  For
 example, if $a is in aCharCollection, it is equivalent to any representation
 of an 'a' in the receiver's character set."

^self isEquivalent: aCharCollection