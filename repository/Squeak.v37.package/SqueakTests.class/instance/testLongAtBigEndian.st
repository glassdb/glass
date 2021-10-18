testing
testLongAtBigEndian

	| bytes |
	bytes := ByteArray new: 8.
	bytes at: 1 put: 16rFF.
	bytes at: 2 put: 16rFF.
	bytes at: 3 put: 16rFF.
	bytes at: 4 put: 16rFF.
	bytes at: 5 put: 0.
	bytes at: 6 put: 0.
	bytes at: 7 put: 0.
	bytes at: 8 put: 0.
  	self assert: (bytes longAt: 1 bigEndian: true) = -1.
	self assert: (bytes longAt: 2 bigEndian: true) = -256.
	self assert: (bytes longAt: 3 bigEndian: true) = -65536.
	self assert: (bytes longAt: 4 bigEndian: true) = -16777216.
	self assert: (bytes longAt: 5 bigEndian: true) = 0.
	self assert: (bytes longAt: 1 bigEndian: false) = -1.
	self assert: (bytes longAt: 2 bigEndian: false) = 16777215.
	self assert: (bytes longAt: 3 bigEndian: false) = 65535.
	self assert: (bytes longAt: 4 bigEndian: false) = 255.
	self assert: (bytes longAt: 5 bigEndian: false) = 0.