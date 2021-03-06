as yet unclassified
checkDependencies
	| dependencies unmet |
	dependencies _ (zip membersMatching: 'dependencies/*') 
			collect: [:member | self extractInfoFrom: (self parseMember: member)].
	unmet _ dependencies reject: [:dep |
		self versions: Versions anySatisfy: (dep at: #id)].
	^ unmet isEmpty or: [
		self error: (String streamContents: [:s|
			s nextPutAll: 'The following dependencies seem to be missing:'; cr.
			unmet do: [:each | s nextPutAll: (each at: #name); cr].
			s nextPutAll: 'Do you still want to install this package?'])]