accessing
value: anObject during: aBlock

	| p oldValue |

	p := Processor activeProcess.
	oldValue := p environmentAt: self ifAbsent: [self default].
	^ [
		p environmentAt: self put: anObject.
		aBlock value.
	  ] ensure: [ 
		p environmentAt: self put: oldValue 
	  ].