private
fillTempMemTo: pct
  | coll |
  coll := OrderedCollection new.
  [ System _tempObjSpacePercentUsed < pct ]
    whileTrue: [ coll add: (String new: 3000) ]