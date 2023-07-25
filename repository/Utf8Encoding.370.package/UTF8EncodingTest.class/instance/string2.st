private
string2

	^String new
		addAll: '123abc';
		add: 16r2013 asCharacter;	"n-dash"
		add: 16r20AC asCharacter;	"euro"
		add: 16r0161 asCharacter;	"s-caron"
		add: 16r010D asCharacter;	"c-caron"
		yourself
