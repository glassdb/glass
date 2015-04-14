tests
testTransientStackValueIndirectPersistenceNoStubbing
  "https://github.com/GsDevKit/GsDevKit/issues/65"

  "https://github.com/GsDevKit/zinc/issues/74"

  Transcript
    cr;
    show: 'testTransientStackValueIndirectPersistenceNoStubbing'.
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
   Use _setNoStubbing.

   Second marksweep (after process terminates) clears the soft reference"
  y := 1 -> nil.
  y
    value:
      (TransientStackValue
        value:
          {3.
          2.
          1}).
  y _setNoStubbing.
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
  self vmMarkSweep.	"First - no stubbing keeps soft ref alive"
  Transcript
    cr;
    show:
        '[1] '
            ,
              (SessionTemps current at: #'TransientStackValue' otherwise: nil) printString.
  self
    assert:
      (SessionTemps current at: #'TransientStackValue' otherwise: nil) isEmpty.
  (Delay forSeconds: 15) wait.
  self vmMarkSweep.	"Second - process no longer active."
  Transcript
    cr;
    show:
        '[2] '
            ,
              (SessionTemps current at: #'TransientStackValue' otherwise: nil) printString.
  self
    assert:
      (SessionTemps current at: #'TransientStackValue' otherwise: nil) isEmpty