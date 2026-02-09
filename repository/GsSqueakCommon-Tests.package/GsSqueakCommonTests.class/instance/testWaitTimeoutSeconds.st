testing
testWaitTimeoutSeconds

  | sema |
  sema := Semaphore new.
  self
    assert: (sema waitTimeoutSeconds: 1)
    equals: true.

  sema signal.
  self
    assert: (sema waitTimeoutSeconds: 1)
    equals: false
