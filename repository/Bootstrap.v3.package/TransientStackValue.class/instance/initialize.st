initialization
initialize
  "ensure that I stay in memory"

  | currentProcess |
  self _setNoStubbing.
  currentProcess := GsProcess _current.
  currentProcess _setNoStubbing.
  currentProcess clientData
    ifNil: [ 
      currentProcess
        clientData:
          (Array new
            _setNoStubbing;
            yourself) ].
  self addToClientData: currentProcess