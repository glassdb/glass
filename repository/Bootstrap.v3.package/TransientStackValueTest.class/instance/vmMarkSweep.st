private
vmMarkSweep
  | limit ar |
  ar := Array new: 20000 withAll: Object new.
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
       ]