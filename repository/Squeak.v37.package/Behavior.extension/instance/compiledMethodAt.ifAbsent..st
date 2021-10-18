*squeak
compiledMethodAt: aSelector ifAbsent: aBlock
        "Answer the compiled method associated with the argument, selector (a Symbol), a message selector in the receiver's method dictionary. If the selector is not in the dictionary, return the value of aBlock"

| meth|
meth := self compiledMethodAt: aSelector otherwise: nil .
meth == nil ifTrue:[ ^ aBlock value ].
^ meth