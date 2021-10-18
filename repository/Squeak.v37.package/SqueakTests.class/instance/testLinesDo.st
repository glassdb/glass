testing
testLinesDo
	| bear sampleCRString sampleLFString sampleCRLFString lines |
	bear := 'Bear', (String with: (Character value: 8364)).
	sampleCRString := 'Fred', String cr , 'the' , String cr , bear.
	sampleLFString := 'Fred', String lf , 'the' , String lf , bear.
	sampleCRLFString := 'Fred', String crlf , 'the' , String crlf , bear.
	
	lines := OrderedCollection new.
	sampleCRString linesDo: [:aLine |
		self deny: (aLine includes: Character cr).
		self deny: (aLine includes: Character lf).
		lines add: aLine].
	self assert: lines asArray = {'Fred'. 'the'. bear. }.
	
	lines := OrderedCollection new.
	sampleLFString linesDo: [:aLine |
		self deny: (aLine includes: Character cr).
		self deny: (aLine includes: Character lf).
		lines add: aLine].
	self assert: lines asArray = {'Fred'. 'the'. bear. }.

	lines := OrderedCollection new.
	sampleCRLFString linesDo: [:aLine |
		self deny: (aLine includes: Character cr).
		self deny: (aLine includes: Character lf).
		lines add: aLine].
	self assert: lines asArray = {'Fred'. 'the'. bear. }.