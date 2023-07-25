private
string3

	^String new
		addAll: '123abc';
		add: 16r2013 asCharacter;	"n-dash"
		add: 16r20AC asCharacter;	"euro"
		add: 16r0161 asCharacter;	"s-caron"
		add: 16r010D asCharacter;	"c-caron"
        add: 16r10000 asCharacter;  
        add: 16r80000 asCharacter;  
        add: 16r38E2D asCharacter;  
        add: 16r38E2E asCharacter;  
        add: 16rE0000 asCharacter;  
        add: 16rE007F asCharacter; 
        add: 16rE0100 asCharacter;
        add: 16rE0190 asCharacter;  
        add: 16rE01EF asCharacter;  
        add: 16rF0000 asCharacter;
        add: 16rF00FF asCharacter;  
        add: 16rFFFFF asCharacter;  
        add: 16r100000 asCharacter;
        add: 16r1000FF asCharacter;  
        add: 16r10FFFF asCharacter; 
		yourself
