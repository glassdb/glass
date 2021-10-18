testing
testStringAsNumber
        "This covers parsing in Number>>readFrom:"

        | aFloat |
        aFloat := '-12.3456e2' asNumber.
        self assert: -1234.56 = aFloat.
        aFloat := '12.3456e2' asNumber.
        self assert: 1234.56 = aFloat.