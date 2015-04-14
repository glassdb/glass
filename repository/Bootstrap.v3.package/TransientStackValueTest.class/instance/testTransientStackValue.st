as yet unclassified
testTransientStackValue
  "https://github.com/GsDevKit/GsDevKit/issues/65"

  "https://github.com/GsDevKit/zinc/issues/74"

  | gc |
  (SessionTemps current at: #'TransientStackValue' otherwise: nil) isEmpty
    ifFalse: [ 
      Transcript
        cr;
        show:
            'Skipping: testTransientStackValue because TransientStackValue softrefs are not empty'.
      ^ self ].
  gc := [ 
  | limit ar |
  ar := Array new: 200000.
  limit := (10 max: System _tempObjSpacePercentUsed // 2) min: 80.
  Transcript
    cr;
    show:
        'limit: ' , limit printString , ' > '
            , System _tempObjSpacePercentUsed printString.
  System gemConfigurationAt: #'GemSoftRefCleanupPercentMem' put: limit.
  ar := nil.
  System _vmMarkSweep.
  (SessionTemps current at: #'TransientStackValue' otherwise: nil)
    keysAndValuesDo: [ :key :val | 
      "force the cleared SoftRefs to be removed"
       ] ].
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
  gc value.
  self
    deny:
      (SessionTemps current at: #'TransientStackValue' otherwise: nil) isEmpty.
  (Delay forSeconds: 15) wait.
  gc value.
  self
    assert:
      (SessionTemps current at: #'TransientStackValue' otherwise: nil) isEmpty