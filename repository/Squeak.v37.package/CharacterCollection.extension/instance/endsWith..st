*squeak
endsWith: suffix
	"Answer whether the tail end of the receiver is the same as suffix.
	 The comparison is case-sensitive."
	| ofs |
	suffix size == 0 ifTrue: [ ^false ].
	(ofs := self size - suffix size) < 0 ifTrue: [^ false].
	^ self at: ofs + 1 equals: suffix 
"
  'Elvis' endsWith: 'vis'
  'Elvis' endsWith: ''
"