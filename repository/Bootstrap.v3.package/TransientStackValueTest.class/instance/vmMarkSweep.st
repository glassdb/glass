private
vmMarkSweep
  10
    timesRepeat: [ 
      | limit |
      limit := (10 max: System _tempObjSpacePercentUsed) * 2 min: 95.
      Transcript
        cr;
        show: 'fill: ' , limit printString.
      self fillTempMemTo: limit.
      limit := (10 max: System _tempObjSpacePercentUsed // 2) min: 80.
      Transcript
        cr;
        show:
            'limit: ' , limit printString , ' > '
                , System _tempObjSpacePercentUsed printString.
      System gemConfigurationAt: #'GemSoftRefCleanupPercentMem' put: limit.
      System _vmMarkSweep ].
  (SessionTemps current at: #'TransientStackValue' otherwise: nil)
    keysAndValuesDo: [ :key :val | 
      "force the cleared SoftRefs to be removed"
       ]