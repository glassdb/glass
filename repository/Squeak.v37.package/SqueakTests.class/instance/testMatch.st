testing
testMatch

  self assert: ('#*@*.*'     match: 'dale.henrichs@gemstone.com').
  self assert: ('#*@#*.#*'  match: 'dale.henrichs@gemstone.com').
  self assert: ('*'      match: 'zort').
  self assert: ('*baz'    match: 'mobaz').
  self deny: ('*baz'    match: 'mobazo').
  self assert: ('*baz*'    match: 'mobazo').
  self deny: ('*baz*'    match: 'mozo').
  self assert: ('foo*'    match: 'foozo').
  self deny: ('foo*'    match: 'bozo').
  self assert: ('foo*baz'  match: 'foo23baz').
  self assert: ('foo*baz'  match: 'foobaz').
  self deny: ('foo*baz'       match: 'foo23bazo').
  self assert: ('foo'    match: 'Foo').
  self deny: ('foo*baz*zort' match: 'foobazort').
  self assert: ('foo*baz*zort' match: 'foobazzort').
  self assert: ('*foo#zort'  match: 'afoo3zortthenfoo3zort').
  self assert: ('*foo*zort'  match: 'afoodezortorfoo3zort').

  "$? allowed in pattern string - now"
  self deny: ('*foo?zort' match: 'afoo3zortthenfoo3zort').