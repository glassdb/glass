*squeak
includesSubstring: aString caseSensitive: aBool

aString size == 0 ifTrue: [ ^false ]. "patch for bug 39473"
^ (self _findString: aString startingAt: 1 ignoreCase: aBool not) > 0