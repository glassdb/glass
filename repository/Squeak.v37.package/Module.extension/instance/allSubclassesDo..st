*squeak
allSubclassesDo: aBlock 

  self thisClass allSubclasses do: [:cl |
    "The following test is for Class class which has to exclude
    the Metaclasses being subclasses of Class."
    cl isMeta ifFalse: [aBlock value: cl]].