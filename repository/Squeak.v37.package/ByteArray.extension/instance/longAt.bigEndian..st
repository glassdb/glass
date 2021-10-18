*squeak
longAt: index bigEndian: aBool
  "Return a 32bit integer quantity starting from the given byte index"

	aBool 
		ifTrue:[ ^ self at: index signed: true width: 4 ] 
		ifFalse:[ | h b2  b1 b0 w |
			w := self at: index.
			b2 := self at: index+1.
			b1 := self at: index+2.
			b0 := self at: index+3.
			h := ((b0 bitAnd: 16r7F) - (b0 bitAnd: 16r80) bitShift: 8) + b1.
			w := (b2 bitShift: 8) + w .
			^ (h bitShift: 16) + w ]