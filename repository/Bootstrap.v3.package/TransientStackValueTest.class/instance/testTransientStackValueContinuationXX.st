tests
testTransientStackValueContinuationXX
  "https://github.com/GsDevKit/zinc/issues/74"

  | server bool |
  Transcript
    cr;
    show: 'testTransientStackValueContinuation||'.
  server := 'connections' -> TransientStackValue value: OrderedCollection new.
  bool := false.
  self assert: server value value notNil.
  [ 
  | z |
  z := server value value add: 1 ] fork.
  self assert: server value value notNil.
  Processor yield.
  [ 
  | x |
  x := server value value add: 2.
  self createContinuation.
  System commitTransaction.
  bool := true ]
    fork.
  [ 
  Processor yield.
  bool ] whileFalse: [ Processor yield ].
  self assert: server value value notNil.
  self letLooseTheHounds.
  Processor yield.
  [ 
  | z |
  z := server value value add: 3 ] fork.
  self assert: server value value notNil.
  [ 
  | z |
  z := server value value add: 4 ] fork.
  self assert: server value value notNil.
  self vmMarkSweep.	"stub sever key and value"
  self assert: server value value notNil.
  Transcript show: '||'