tests
testTransientStackValueContinuation
  "https://github.com/GsDevKit/zinc/issues/74"

  | server bool |
  Transcript
    cr;
    show: 'testTransientStackValueContinuation||'.
  server := 'connections' -> (TransientStackValue value: OrderedCollection new).
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
  bool ] whileFalse: [ self vmMarkSweep ].
  self assert: server value value notNil.
  self letLooseTheHounds.
  [ 
  | sem |
  sem := TransientSemaphore new.
  5
    timesRepeat: [ 
      [ 
      self vmMarkSweep.
      sem signal ] fork.
      sem wait.
      self vmMarkSweep ] ]
    value.
  self assert: server value value notNil.
  System abortTransaction.
  Transcript show: '||'