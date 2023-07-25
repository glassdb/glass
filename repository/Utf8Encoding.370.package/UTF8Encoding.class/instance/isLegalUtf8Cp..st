testing
isLegalUtf8Cp: aCodePoint
  aCodePoint < 0 ifTrue:[ ^ false ].
  (aCodePoint >= 16rD800 and:[ aCodePoint <= 16rDFFF]) ifTrue:[ ^ false ].
  aCodePoint > 16r10FFFF ifTrue:[ ^ false ].
  ^ true