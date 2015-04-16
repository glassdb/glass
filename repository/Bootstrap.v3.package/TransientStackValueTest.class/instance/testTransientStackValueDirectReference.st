tests
testTransientStackValueDirectReference
  "https://github.com/GsDevKit/zinc/issues/74"

  Transcript
    cr;
    show: 'testTransientStackValueDirectReference<'.
  [ 
  | y |
  "Direct reference to TransientStackValue via temp var ... should fail without scheduler stubbing"
  y := TransientStackValue
    value:
      {3.
      2.
      1}.
  Smalltalk at: #'TSV' put: y.
  System commitTransaction.
  (Delay forSeconds: 10) wait.
  Transcript show: 'bye bye' ]
    fork.
  self letLooseTheHounds.
  (Delay forSeconds: 1) wait.
  self assert: (Smalltalk at: #'TSV') value notNil.
  (Delay forSeconds: 15) wait.
  self vmMarkSweep.	"force stubbing"
  self assert: (Smalltalk at: #'TSV') value isNil.
  Transcript show: '>'