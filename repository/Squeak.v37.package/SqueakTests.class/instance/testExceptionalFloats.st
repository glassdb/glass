testing
testExceptionalFloats
  "http://code.google.com/p/glassdb/issues/detail?id=294"

  | assocs |
  assocs := {('PlusInfinity' -> 'PlusInfinity').
  ('MinusInfinity' -> 'MinusInfinity').
  ('PlusQuietNaN' -> 'PlusQuietNaN').
  ('MinusQuietNaN' -> 'MinusQuietNaN').
  ('PlusSignalingNaN' -> 'PlusSignalingNaN').
  ('MinusSignalingNaN' -> 'MinusSignalingNaN').
  ('Infinity' -> 'PlusInfinity').
  ('-Infinity' -> 'MinusInfinity').
  ('NaN' -> 'PlusQuietNaN')}.
  assocs
    do: [ :assoc | 
      | source expected number printString |
      source := assoc key.
      expected := assoc value.
      number := source asNumber.
      printString := number asString.
      self assert: printString = expected ]