*squeak
sourceCodeAt: selector ifAbsent: aBlock

    | code |
    code := [self sourceCodeAt: selector] onException: Error do: [:ex | ^aBlock value ].
    code ifNil: [ ^aBlock value ].
    ^code