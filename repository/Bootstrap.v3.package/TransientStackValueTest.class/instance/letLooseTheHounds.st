private
letLooseTheHounds
  | limit |
  limit := 30.
  hounds := {}.
  hounds
    add:
      [ 
      | cnt |
      cnt := 0.
      [ 
      cnt := cnt + 1.
      cnt < limit ]
        whileTrue: [ 
          (Delay forSeconds: 1) wait.
          Transcript show: '=' ] ]
        fork.
  hounds
    add:
      [ 
      | cnt |
      cnt := 0.
      [ 
      cnt := cnt + 1.
      cnt < limit ]
        whileTrue: [ 
          (Delay forSeconds: 1) wait.
          Transcript show: '_' ] ]
        fork.
  hounds
    add:
      [ 
      | cnt |
      cnt := 0.
      [ 
      cnt := cnt + 1.
      cnt < limit ]
        whileTrue: [ 
          (Delay forSeconds: 1) wait.
          Transcript show: '-' ] ]
        fork.
  hounds
    add:
      [ 
      | cnt |
      cnt := 0.
      [ 
      cnt := cnt + 1.
      cnt < limit ]
        whileTrue: [ 
          (Delay forSeconds: 1) wait.
          Transcript show: '+' ] ]
        fork