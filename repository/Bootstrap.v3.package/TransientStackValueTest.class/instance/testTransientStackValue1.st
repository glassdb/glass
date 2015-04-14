tests
testTransientStackValue1
  "https://github.com/GsDevKit/GsDevKit/issues/65"

  "https://github.com/GsDevKit/zinc/issues/74"

  (SessionTemps current at: #'TransientStackValue' otherwise: #()) isEmpty
    ifFalse: [ 
      Transcript
        cr;
        show:
            'Skipping: testTransientStackValue because TransientStackValue softrefs are not empty'.
      ^ self ].
  [ 
  | y |
  y := TransientStackValue
    value:
      {3.
      2.
      1}.
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
  self vmMarkSweep.
  self
    deny:
      (SessionTemps current at: #'TransientStackValue' otherwise: nil) isEmpty.
  (Delay forSeconds: 15) wait.
  self vmMarkSweep.
  self
    assert:
      (SessionTemps current at: #'TransientStackValue' otherwise: nil) isEmpty