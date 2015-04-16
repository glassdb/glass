tests
testTransientStackValueContinuationX
  "https://github.com/GsDevKit/zinc/issues/74"

  Transcript
    cr;
    show: 'testTransientStackValueContinuation<'.
  self letLooseTheHounds.
  [ 
  | y |
  "Reference via persistent continuation ... should fail without scheduler stubbing"
  Transcript show: 'hello hello'.
  y := TransientStackValue
    value:
      {3.
      2.
      1}.
  self createContinuation.
  System commitTransaction.
  Transcript show: 'bye bye' ]
    fork.
  (Delay forSeconds: 1) wait.
  self assert: (Smalltalk at: #'TSV') value notNil.
  (Delay forSeconds: 15) wait.
  self vmMarkSweep.	"force stubbing missing end of comment"
  self assert: (Smalltalk at: #'TSV') value isNil.
  Transcript show: '>'