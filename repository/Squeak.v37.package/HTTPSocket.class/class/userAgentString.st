accessing
userAgentString 
	"self userAgentString"

	^'User-Agent: GemStone',
		(System _gemVersion copyUpTo: $,)