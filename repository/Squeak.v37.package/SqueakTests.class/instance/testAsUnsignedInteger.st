testing
testAsUnsignedInteger
  self assert: '-10' asUnsignedInteger = 10.
  self assert: 'test' asUnsignedInteger = nil.
  self assert: 'é è à ô ü ö ß ä ó ñ í á' asUnsignedInteger = nil.
  self assert: 'test-10test' asUnsignedInteger = 10.
  self assert: '' asUnsignedInteger = nil.
  self assert: '1234567890-1234567890' asUnsignedInteger = 1234567890.
  self assert: '--12345' asUnsignedInteger = 12345