squeak protocol
readFrom: aStream

	| m y c |

	m _ (ReadWriteStream with: '') reset.

	[(c _ aStream next) isSeparator] whileFalse: [m nextPut: c].

	[(c _ aStream next) isSeparator] whileTrue.

	y _ (ReadWriteStream with: '') reset.

	y nextPut: c.

	[aStream atEnd] whileFalse: [y nextPut: aStream next].


	^ self 
		month: m contents
		year: y contents

"Month readFrom: 'July 1998' readStream"