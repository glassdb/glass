tests
testTransientStackValueDirectReference2
  "https://github.com/GsDevKit/zinc/issues/74"

  self
    transientStackValueDirectReferenceTestWith: TestTransientStackValue
    expectStubbing: true