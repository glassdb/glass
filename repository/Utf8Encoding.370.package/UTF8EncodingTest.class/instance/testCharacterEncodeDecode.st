testing
testCharacterEncodeDecode
	"VW3 lacks a FourByteString class, so this test can't work with strings.
	Also, Character doesn't support the largest UTF-8 value, 2 ** 31 - 1.
	Expect exceptions if debugging this method: it creates Character instances
	that can't be displayed by the VW debugger.
	GemStone won't allow a Character to have a value > 65535."

	| range encoder sample stream encoded decoded  |
	encoder := UTF8Encoding new.
	range := self isGemStone
		ifTrue: [#($a 353 8211)]
		ifFalse: [#($a 353 8211 123456 8765432 536870911)].

	range doWithIndex: [ :each :index | | stream |
		sample := each asCharacter.
        stream := WriteStream on: String new.
		encoder nextPut: sample on: stream.
        encoded := stream contents.
		self assert: encoded size = index.
		decoded := encoder nextFrom: encoded readStream.
		self assert: decoded = sample]
