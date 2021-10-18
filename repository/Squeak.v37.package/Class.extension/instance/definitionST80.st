*squeak
definitionST80

	| stream strBlock |
	stream := WriteStream on: String new.
	strBlock := [:list | String streamContents: [ :str |
				list
					do: [ :field | str nextPutAll: field ]
					separatedBy: [ str nextPutAll: ' ' ]]].
	stream 
		nextPutAll: self superclass name;
		nextPutAll: self kindOfSubclass;
		nextPut: $# ;
		nextPutAll: self name;
		cr; tab;
		nextPutAll: 'instanceVariableNames: ';
		store: (strBlock value: self instVarNames);
		cr; tab;
		nextPutAll: 'classVariableNames: ';
		store: (strBlock value: self _sortedClassVarNames);
		cr; tab;
		nextPutAll: 'poolDictionaries: ';
		store: (strBlock value: self poolDictionaryNames);
		cr; tab;
		nextPutAll: 'category: ';
		store: self category.
	^stream contents