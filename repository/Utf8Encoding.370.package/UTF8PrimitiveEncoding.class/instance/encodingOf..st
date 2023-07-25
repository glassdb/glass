API
encodingOf: aCodePoint
  "^<aString>"

  "self new encodingOf: 16r2013"

  ^ aCodePoint asCharacter asString encodeAsUTF8intoString