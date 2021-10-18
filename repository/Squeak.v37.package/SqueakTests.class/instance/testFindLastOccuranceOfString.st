testing
testFindLastOccuranceOfString
      "Test pattern with a repeated prefix"
        self assert: ('o' findLastOccuranceOfString: 'oo' startingAt: 1) = 0.
        self assert: ('oo' findLastOccuranceOfString: 'oo' startingAt: 1) = 1.
        self assert: ('ooo' findLastOccuranceOfString: 'oo' startingAt: 1) = 2.
        
        self assert: ('ruby.rbx' findLastOccuranceOfString: 'r' startingAt: 1) = 6.
        self assert: ('ruby.rbx' findLastOccuranceOfString: 'r' startingAt: 2) = 6.
        self assert: ('ruby.rbx' findLastOccuranceOfString: 'z' startingAt: 2) = 0.

        "Test single character strings matching last character of self"
        self assert:('ruby.rbx' findLastOccuranceOfString: 'x' startingAt: 1) = 8.
        self assert:('ruby.rxx' findLastOccuranceOfString: 'x' startingAt: 1) = 8.
        self assert:('ruby.rxx' findLastOccuranceOfString: 'x' startingAt: 8) = 8.
        self assert:('ruby.rxx' findLastOccuranceOfString: 'x' startingAt: 7) = 8.
        
        "Test when subString is longer than self"
        self assert:('x' findLastOccuranceOfString: 'xxxxx' startingAt: 1) = 0.
        self assert:('xx' findLastOccuranceOfString: 'xxxxx' startingAt: 1) = 0.
        self assert:('xxxx' findLastOccuranceOfString: 'xxxxx' startingAt: 1) = 0.
        self assert:('xxxxx' findLastOccuranceOfString: 'xxxxx' startingAt: 1) = 1.
        self assert:('xxxxxx' findLastOccuranceOfString: 'xxxxx' startingAt: 1) = 2.