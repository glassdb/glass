inspector
debuggerInspectorNodes
	<inspector: #'+' priority: 200>

	| numArgs isBlock nodes |
	numArgs := self selector numArgs.
	isBlock := ((receiver isKindOf: BlockClosure) _and: [receiver ~~ frameSelf]).
	isBlock ifTrue: [ numArgs := receiver numArgs ].
	nodes := OrderedCollection with: (OTDerivedInspectorNode on: self label: 'thisContext' block: [ :obj | self ]).
	self tempNames withIndexDo: [ :name :index | | prefix |
		name asString ~= 'self'
			ifTrue: [ "3.0 includes self ref in tempnames which can be confusing"
				prefix := numArgs >= index
					ifTrue: [isBlock ifTrue: [ '[ '] ifFalse: [ ': ' ]]
					ifFalse: ['| '].
				nodes add: (OTContextTempVariableNode on: self prefix: prefix name: name value: (self tempAt: index)) ]].
	^nodes