private
string1
	"Characters > 255 can't be coded as literals because GemStone's
	file-in and file-out mechanisms still don't support them."

	^String new
		add: $a;
		add: $b;
		add: 16r2013 asCharacter;	"n-dash"
		add: 16r20AC asCharacter;	"euro"
		add: 16r0161 asCharacter;	"s-caron"
		add: 16r010D asCharacter;	"c-caron"
		yourself
