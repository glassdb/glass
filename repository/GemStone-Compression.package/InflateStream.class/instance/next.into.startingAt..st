accessing
next: n into: buffer startingAt: startIndex
  "Read n objects into the given collection. 
	Return aCollection or a partial copy if less than
	n elements have been read."

  | c numRead count |
  n = 0
    ifTrue: [ ^ buffer ].
  numRead := 0.
  [ 
  "Force decompression if necessary"
  self atEnd
    ifTrue: [ ^ buffer copyFrom: 1 to: startIndex + numRead - 1 ].
  c := self next.	"Store the first value which provoked decompression"
  buffer at: startIndex + numRead put: c.
  numRead := numRead + 1.	"After collection has been filled copy as many objects as possible"
  count := readLimit - position + 1 min: n - numRead.
  buffer
    replaceFrom: startIndex + numRead
    to: startIndex + numRead + count - 1
    with: itsCollection
    startingAt: position.
  position := position + count.
  numRead := numRead + count.
  numRead = n ]
    whileFalse.
  ^ buffer