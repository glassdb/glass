private
generateRandomSingleByteString: count
  | string generator encoder |
  string := String new.
  generator := Random seed: 10112347.
  encoder := UTF8Encoding new.
  count
    timesRepeat: [ 
      | codePoint |
      codePoint := self nextInt: 16rFF using: generator.
      [ 
      "skip codePoint for which there is no legal UTF8 encoding"
      encoder isLegalUtf8Cp: codePoint ]
        whileFalse: [ codePoint := self nextInt: 16rFF using: generator ].
      self checkEncoding: codePoint using: encoder.
      string add: codePoint asCharacter ].
  ^ string copy	"avoid GemStone internal side effects caused by growing the String"