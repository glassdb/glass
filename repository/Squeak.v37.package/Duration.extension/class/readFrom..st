*squeak
readFrom: aStream
  "Formatted per: [-]D:HH:MM:SS"

  | sign days hours minutes seconds ws |
  sign := (aStream peekFor: $-) ifTrue: [-1] ifFalse: [1].

  days := (aStream upTo: $:) asInteger sign: sign.
  hours := (aStream upTo: $:) asInteger sign: sign.
  minutes := (aStream upTo: $:) asInteger sign: sign.

  aStream atEnd 
    ifTrue: [ seconds := 0 . ]
    ifFalse: 
      [ ws := String new writeStream.
      [aStream atEnd] 
        whileFalse: [ ws nextPut: aStream next ].
      seconds := ws contents asInteger sign: sign].

  ^ self days: days hours: hours minutes: minutes seconds: seconds.

  "  '0:00:00:00' asDuration
    '0:00:00:01' asDuration
    '0:12:45:45' asDuration
    '1:00:00:00' asDuration
    '365:00:00:00' asDuration
    '-7:09:12:06' asDuration
    '+0:01:02' asDuration
    '+0:01:02:3' asDuration
   "