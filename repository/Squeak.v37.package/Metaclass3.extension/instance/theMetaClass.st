*squeak
theMetaClass
   ^ self isMeta ifTrue:[ self ] ifFalse:[ self class ]