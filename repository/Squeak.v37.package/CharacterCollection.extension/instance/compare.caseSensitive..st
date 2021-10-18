*squeak
compare: aString caseSensitive: aBool
        "Answer a comparison code telling how the receiver sorts relative to
        aString: 1 - before
        2 - equal
        3 - after.
        "
   ^ (self compareTo: aString
           collator: (aBool ifTrue:[ IcuCollator default ]
                          ifFalse:[ IcuCollator defaultCaseInsensitive  ])
           useMinSize: true) + 2
