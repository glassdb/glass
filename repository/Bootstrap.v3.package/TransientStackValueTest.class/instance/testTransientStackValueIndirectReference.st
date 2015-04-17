tests
testTransientStackValueIndirectReference
  "https://github.com/GsDevKit/zinc/issues/74"

  Transcript
    cr;
    show: 'testTransientStackValueIndirectReference<'.
  [ 
  | x y |
  "No direct reference to TransientStackValue from stack ... should always fail
   Proof that we can force stubbing. "
  y := TransientStackValue
    value:
      {3.
      2.
      1}.
  x := 2 -> y.
  Smalltalk at: #'TSV' put: y.
  y := nil.	"no reference from stack"
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