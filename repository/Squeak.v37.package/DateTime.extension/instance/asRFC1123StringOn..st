*squeak
asRFC1123StringOn: aStream

	aStream nextPutAll: (self asStringGmtUsingFormat: #(1 2 3 $  2 1 $: true true false))