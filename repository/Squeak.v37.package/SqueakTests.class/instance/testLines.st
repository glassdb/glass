testing
testLines

	| mbString line stream crlf cr lf lines |
	mbString := String with: (Character value: 8364).
	mbString := ''.
	line := 'abce', mbString, 'fgh'.
	stream := WriteStream on: String new.
	crlf := String crlf.
	cr := String cr.
	lf := String lf.
	stream 
		nextPutAll: line;
		nextPutAll: crlf;
		nextPutAll: line;
		nextPutAll: cr;
		nextPutAll: line;
		nextPutAll: lf;
		nextPutAll: line;
		nextPutAll: cr.
	lines := stream contents lines.
	self assert: lines size == 4.
	lines do: [:result | self assert: line = result ]