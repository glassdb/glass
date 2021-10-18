testing
testQuadByteStringMatch

	| str1 pat |
	self assert: ('*'			match: 'zort' asQuadByteString).
	self assert: ('*baz'		match: 'mobaz' asQuadByteString).
	self deny: ('*baz'		match: 'mobazo' asQuadByteString).
	self assert: ('*baz*'		match: 'mobazo' asQuadByteString).
	self deny: ('*baz*'		match: 'mozo' asQuadByteString).
	self assert: ('foo*'		match: 'foozo' asQuadByteString).
	self deny: ('foo*'		match: 'bozo' asQuadByteString).
	self assert: ('foo*baz'	match: 'foo23baz' asQuadByteString).
	self assert: ('foo*baz'	match: 'foobaz' asQuadByteString).
	self deny: ('foo*baz'	match: 'foo23bazo' asQuadByteString).
	self assert: ('foo'		match: 'Foo' asQuadByteString).
	self deny: ('foo*baz*zort' match: 'foobazort' asQuadByteString).
	self assert: ('foo*baz*zort' match: 'foobazzort' asQuadByteString).
	self assert: ('*foo#zort'	match: 'afoo3zortthenfoo3zort' asQuadByteString).
	self assert: ('*foo*zort'	match: 'afoodezortorfoo3zort' asQuadByteString).

	"$? allowed in pattern string - now"
	self deny: ('*foo?zort' match: 'afoo3zortthenfoo3zort' asQuadByteString).
	str1 := QuadByteString new.
	{
		16rFF asCharacter.
		16rFF asCharacter.
		16rFF asCharacter.
		16rFF asCharacter.
		16rFFFFF asCharacter.
	} do: [:char | str1 add: char ].
	self assert: ('*' match: str1).
	pat := QuadByteString new.
	{
		16rFF asCharacter.
		$#.
		16rFF asCharacter.
		$*.
	} do: [:char | pat add: char ].
	self assert: (pat match: str1)