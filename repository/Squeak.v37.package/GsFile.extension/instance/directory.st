*squeak
directory

	| dirClass |
	dirClass := self isClient
		ifTrue: [ ClientFileDirectory ]
		ifFalse: [ ServerFileDirectory ].
	^dirClass on: (dirClass dirPathFor: self pathName)