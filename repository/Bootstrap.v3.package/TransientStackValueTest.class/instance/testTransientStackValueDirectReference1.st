tests
testTransientStackValueDirectReference1
  "https://github.com/GsDevKit/zinc/issues/74"

  self
    transientStackValueDirectReferenceTestWith: TransientStackValue
    expectStubbing: false