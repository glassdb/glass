*squeak
linesDo: aBlock
	"optimized for ReadByteStream"

  | input cr lf c |
  input := self contents readStream.
  cr := Character cr.
  lf := Character lf.
  [ (c := input peek) ~~ nil ] whileTrue:[ | res |
    res := String new.
    [ c == nil or: [ c == cr or:[ c == lf] ] ] whileFalse:[
      res add: input next .
      c := input peek .
    ].
    aBlock value: res.
    input next == cr ifTrue:[ input peek == lf ifTrue:[ input next ]]
  ].