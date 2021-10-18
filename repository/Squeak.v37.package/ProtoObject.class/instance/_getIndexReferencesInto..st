indexing support
_getIndexReferencesInto: refsToRcvr

"Place information about references to the receiver due to the receiver's 
 participation in an index into the given Array.  The Array consists of pairs:

 1) An object that references the receiver.  If the object is directly
    contained in an indexed NSC, then this object is the NSC.  If the object
    in the dependency list is a tracking object (for object modification
    tracking), then this object is the tracking object.
 2) The offset of the instance variable in that object that references the
    receiver.  If the object is directly contained in an indexed NSC, this
    number is zero.  If the object in the dependency list is a tracking
    object, this number is -1.

 This is used only in support of the 'become:' method."

| depList |

depList := DependencyList for: self.
depList == nil
  ifTrue: [ ^ refsToRcvr ].
self error: 'Instances of ProtoObject should not have dependents'