private
generateRandomUSASCIIString: count
  | string generator encoder |
  string := String new.
  generator := Random seed: 47101123.
  encoder := UTF8Encoding new.
  count
    timesRepeat: [ 
      | codePoint encoding |
      codePoint := self nextInt: 16r7F using: generator.
      string add: codePoint asCharacter ].
  ^ string copy	"avoid GemStone internal side effects caused by growing the String"