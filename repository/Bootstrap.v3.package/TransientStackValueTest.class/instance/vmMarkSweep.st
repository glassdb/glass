private
vmMarkSweep
  10
    timesRepeat: [ 
      | limit |
      limit := (10 max: System _tempObjSpacePercentUsed) * 6 min: 95.
      self fillTempMemTo: limit.
      System _vmMarkSweep ].
  Transcript show: 'stubbed'