private
generateRandomDoubleByteString: count
  | string generator encoder |
  string := String new.
  generator := Random seed: 23471011.
  encoder := UTF8Encoding new.
  count
    timesRepeat: [ 
      | codePoint encoding |
      codePoint := self nextInt: 16rFFFF using: generator.
      [ 
      "skip codePoint for which there is no legal UTF8 encoding"
      encoder isLegalUtf8Cp: codePoint ]
        whileFalse: [ codePoint := self nextInt: 16rFFFF using: generator ].
      self checkEncoding: codePoint using: encoder.
      encoding := encoder encodingOf: codePoint.
      string add: codePoint asCharacter ].
  ^ string copy	"avoid GemStone internal side effects caused by growing the String"