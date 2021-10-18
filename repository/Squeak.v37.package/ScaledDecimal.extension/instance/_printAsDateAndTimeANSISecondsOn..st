*squeak
_printAsDateAndTimeANSISecondsOn: aStream
	| string i noDecimalPoint |
	"Adding 100 causes a very tiny loss of precission but makes parsing much easier"
	self = 0
		ifTrue: [ aStream nextPutAll: '00' ]
		ifFalse: [ 
			string := (self + 100) asStringLocaleC.
			(string at: 4) = $.
				ifFalse: [ self error: 'unexpected format' ].
			i := string size.
			noDecimalPoint := true.
			[ 
			| char |
			"strip trailing 0's"
			char := string at: i.
			noDecimalPoint
				ifTrue: [ noDecimalPoint := char ~= $. ].
			noDecimalPoint and: [ char = $0 ] ]
				whileTrue: [ i := i - 1 ].
			noDecimalPoint
				ifFalse: [ 
					"don't include the decimal point in the printString, if $. is last character"
					i := i - 1 ].
			aStream nextPutAll: (string copyFrom: 2 to: i) ]