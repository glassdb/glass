tests
testTransientStackValueIndirectPersistenceStubbing
  "https://github.com/GsDevKit/GsDevKit/issues/65"

  "https://github.com/GsDevKit/zinc/issues/74"

  Transcript
    cr;
    show: 'testTransientStackValueIndirectPersistenceStubbing'.
  (SessionTemps current at: #'TransientStackValue' otherwise: #()) isEmpty
    ifFalse: [ 
      Transcript
        cr;
        show:
            'Skipping: testTransientStackValue because TransientStackValue softrefs are not empty'.
      ^ self ].
  [ 
  | y |
  "Indirect reference to TransientStackValue via temp var to Association.
   Persist the Association.
   Do not use _setNoStubbing.

   Without no stubbing first marksweep clears to the soft reference"
  y := 1 -> nil.
  y
    value:
      (TransientStackValue
        value:
          {3.
          2.
          1}).
  self
    deny:
      (SessionTemps current at: #'TransientStackValue' otherwise: nil) isEmpty.
  Smalltalk at: #'TSV' put: y.
  System commitTransaction.
  (Delay forSeconds: 10) wait.
  Transcript
    cr;
    show: 'bye bye' ]
    fork.
  [ 
  [ true ]
    whileTrue: [ 
      (Delay forSeconds: 1) wait.
      Transcript show: '=' ] ]
    fork.
  [ 
  [ true ]
    whileTrue: [ 
      (Delay forSeconds: 1) wait.
      Transcript show: '_' ] ]
    fork.
  [ 
  [ true ]
    whileTrue: [ 
      (Delay forSeconds: 1) wait.
      Transcript show: '-' ] ]
    fork.
  [ 
  [ true ]
    whileTrue: [ 
      (Delay forSeconds: 1) wait.
      Transcript show: '+' ] ]
    fork.
  (Delay forSeconds: 1) wait.
  self vmMarkSweep.	"First - without no stubbing, soft reference cleared."
  Transcript
    cr;
    show:
        '[1] '
            ,
              (SessionTemps current at: #'TransientStackValue' otherwise: nil) printString.
  self
    assert:
      (SessionTemps current at: #'TransientStackValue' otherwise: nil) isEmpty