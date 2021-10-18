printing
propertyListOn: aStream 
	" {x=a; y=b; width=c; height=d} "
	aStream print:'{ x='; write:origin x;
			print:' y='; write:origin y;
			print:' width='; write:self extent x;
			print:' height='; write:self extent y;
			print:'};'.