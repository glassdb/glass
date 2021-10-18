testing
testDateAndTimeFromString
  "with SmallDateAndTime, microseconds accuracy is enforced ... so limit tests to that range"

  | dateAndTime x aDateAndTime gemstoneVersion23 |
  dateAndTime := DateAndTime now.
  (gemstoneVersion23 := (System stoneVersionAt: 'gsVersion') beginsWith: '2.3')
    ifTrue: [ dateAndTime := DateAndTime fromSeconds: dateAndTime asSeconds rounded ].
  self
    assert:
      (x := DateAndTime fromString: dateAndTime asString) asString
        = dateAndTime asString.
  aDateAndTime := DateAndTime epoch.
  self
    assert:
      aDateAndTime = (DateAndTime fromString: ' 1901-01-01T00:00:00+00:00').
  aDateAndTime := self epochLocalOffset.
  self assert: aDateAndTime = (DateAndTime fromString: ' 1901-01-01T00:00:00').
  self assert: aDateAndTime = (DateAndTime fromString: ' 1901-01-01T00:00').
  self
    assert:
      '2008' asDateAndTime _shiftToUTC printString = '2008-01-01T00:00:00+00:00'.
  self
    assert:
      '2008-08' asDateAndTime _shiftToUTC printString = '2008-08-01T00:00:00+00:00'.
  self
    assert:
      '2006-08-28' asDateAndTime _shiftToUTC printString = '2006-08-28T00:00:00+00:00'.
  self
    assert:
      ('2006-08-28' , (String with: (Character value: 8364))) asDateAndTime
        _shiftToUTC printString = '2006-08-28T00:00:00+00:00'.
  gemstoneVersion23
    ifTrue: [ 
      "in GemStone 2.3, nanoseconds are ignored in DateAndTime printString format"
      "Regular nanoseconds"
      self
        assert:
          '2006-08-28T00:00:00.123456789' asDateAndTime _shiftToUTC printString
            = '2006-08-28T00:00:00+00:00'.	"Extra picoseconds precision should not spoil the DateAndTime"
      self
        assert:
          '2006-08-28T00:00:00.123456789000' asDateAndTime _shiftToUTC printString
            = '2006-08-28T00:00:00+00:00'.	"lots more precision for even more fun"
      self
        assert:
          '2006-08-28T00:00:00.123456789123456789+00:00' asDateAndTime _shiftToUTC
            printString = '2006-08-28T00:00:00+00:00' ]
    ifFalse: [ 
      "SmallDateAndTime limited to microseconds, so we will not try testing beyohd that anymore"
      self
        assert:
          '2006-08-28T00:00:00.123456' asDateAndTime _shiftToUTC printString
            = '2006-08-28T00:00:00.123456+00:00' ].
  self
    assert:
      '2006-08-28T00:00:00.123456' asDateAndTime _shiftToUTC asSeconds
        = (ScaledDecimal fromString: '178416000.123456').
  self
    assert:
      '2006-08-28T00:00:00.123456+00:00' asDateAndTime _shiftToUTC asSeconds
        = (ScaledDecimal fromString: '178416000.123456')