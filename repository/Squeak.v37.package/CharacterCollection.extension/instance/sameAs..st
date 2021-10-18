*squeak
sameAs: aString
        "Answer whether the receiver sorts equal to aString. The
        collation sequence is ascii with case differences ignored."
    ^(self compareTo: aString collator: IcuCollator defaultCaseInsensitive
        useMinSize: true) == 0
