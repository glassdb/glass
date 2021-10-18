parsing-private
readNamedFloatOrFail
	"This method is used when there is no digit encountered:
	It try and read a named Float NaN or Infinity.
	Negative sign for -Infinity has been read before sending this method, and is indicated in the neg inst.var.
	Fail if no named Float is found.

	GemStone has the following exceptional values:
		'PlusInfinity', 'MinusInfinity', 'PlusQuietNaN',
		'MinusQuietNaN', 'PlusSignalingNaN', or 'MinusSignalingNaN'"

	neg
		ifFalse: [ 
			#('PlusInfinity' 'MinusInfinity' 'PlusQuietNaN' 'MinusQuietNaN' 'PlusSignalingNaN' 'MinusSignalingNaN')
				do: [ :str | 
					(sourceStream nextMatchAll: str)
						ifTrue: [ ^ Float fromString: str ] ].
			(sourceStream nextMatchAll: 'NaN')
				ifTrue: [ ^ Float nan ] ].
	(sourceStream nextMatchAll: 'Infinity')
		ifTrue: [ 
			^ neg
				ifTrue: [ Float infinity negated ]
				ifFalse: [ Float infinity ] ].
	^ self expected: 'a digit between 0 and ' , (String with: (Character digitValue: base - 1))