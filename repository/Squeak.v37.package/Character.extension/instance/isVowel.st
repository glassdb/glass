*squeak
isVowel

"Returns true if the receiver is a vowel ('Y' is NOT considered to be a vowel).
 Returns false otherwise.

This code assumes that the collation sequence places all uppercase variations
of a given letter (including various diacritical marks) immediately following the
plain version of the letter.

"

| ucs arr |
ucs := self asUppercase sortValue.
arr := #($A $E $I $O $U ) .
1 to: arr size do:[:j | | v |
  v := arr at: j .
  ( ucs < v sortValue ) ifTrue: [ ^ 
    false 
  ].
  ( ucs < ( ( Character withValue: ( v asciiValue ) + 1 ) sortValue )) ifTrue:[      ^ true 
  ] 
].
^ false