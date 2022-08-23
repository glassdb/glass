*squeak
compare: aString
        "Answer a comparison code telling how the receiver sorts relative to
        aString: 1 - before
        2 - equal
        3 - after.
        The collation sequence is ascii with case differences ignored.
        To get the effect of a <= b, but ignoring case, use (a compare: b) <= 2."
  ^ (self compareTo: aString collator: IcuCollator defaultCaseInsensitive
         useMinSize: true) + 2