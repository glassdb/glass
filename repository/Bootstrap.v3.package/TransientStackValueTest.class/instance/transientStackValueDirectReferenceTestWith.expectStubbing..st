private
transientStackValueDirectReferenceTestWith: aTransientStackValueClass expectStubbing: expectStubbing
  | sem1 sem2 |
  sem1 := TransientSemaphore new.
  sem2 := TransientSemaphore new.
  [ 
  | y |
  y := aTransientStackValueClass
    value:
      {3.
      2.
      1}.
  Smalltalk at: #'TSV' put: y.
  System commitTransaction.
  sem1 signal.
  sem2 wait ]
    fork.
  self letLooseTheHounds.
  (Delay forSeconds: 2) wait.
  sem1 wait.	"wait for commit to be completed"
  self assert: (Smalltalk at: #'TSV') value notNil.	"not stubbed yet"
  self vmMarkSweep.	"force stubbing"
  expectStubbing
    ifTrue: [ 
      "should be stubbed"
      self assert: (Smalltalk at: #'TSV') value isNil ]
    ifFalse: [ 
      "should not be stubbed"
      self assert: (Smalltalk at: #'TSV') value notNil ].
  sem2 signal